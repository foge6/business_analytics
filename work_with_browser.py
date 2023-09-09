from selenium import webdriver
import sys
import codecs
from bs4 import BeautifulSoup
sys.stdout = codecs.getwriter("utf-8")(sys.stdout.detach()) # устанавливается кодировка вывода в консоль в UTF-8.
def get_page_content(url): #  определяется функция get_page_content с одним параметром url.
    options = webdriver.FirefoxOptions() # создается объект options класса FirefoxOptions из модуля webdriver.
    options.add_argument('--headless')  # Запуск браузера в фоновом режиме
    options.add_argument('--no-sandbox') # добавляется аргумент --no-sandbox в объект options, чтобы отключить использование песочницы.
    options.add_argument('--disable-dev-shm-usage') #добавляется аргумент --disable-dev-shm-usage в объект options, чтобы отключить использование общей памяти для дочерних процессов.
    driver = webdriver.Firefox(options=options)
    driver.get(url) # открывается указанный URL в браузере.

    # Ждем загрузки страницы
    driver.implicitly_wait(10)

    # Получаем содержимое страницы
    content = driver.page_source

    soup = BeautifulSoup(content, 'html.parser') # создается объект soup класса BeautifulSoup из переданного содержимого страницы и парсера
    span_element = soup.find('div', class_='like_views like_views--inActionPanel') # находится первый элемент <div> с классами 'like_views' и 'like_views--inActionPanel'.
    title = (span_element.get('title').split(' ')) # получается значение атрибута 'title' элемента span_element и разделяется по пробелам, результат сохраняется в переменную title.
    # Закрываем браузер
    driver.quit()

    return title
url = 'https://vk.com/wall240305905_2963'
content = get_page_content(url)
print(int(content[0]))