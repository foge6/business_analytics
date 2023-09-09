import csv
import sys
import codecs 
sys.stdout = codecs.getwriter("utf-8")(sys.stdout.detach())
import csv
# Открываем csv файл для чтения
with open('new.csv', 'r') as file:
    # Читаем содержимое файла
    reader = csv.reader(file,delimiter=';')
    # Преобразуем содержимое файла в список строк с разделителем ","
    rows = list(reader)
with open('itog.csv', 'r') as f:
    # Читаем содержимое файла
    read = csv.reader(f,delimiter=';')
    # Преобразуем содержимое файла в список строк с разделителем ","
    data = list(read)
# ,delimiter=';'

id = 1328
keys = {'id': [], 'mail': [], 'summ': []}
mail='gee'
summ=0
for row in rows:
    if row[0]==id:#если новая строка такая же, как была
        summ = int(summ) + int(row[6]) #прибавляем к сумме
        mail=row[2]
    else: # если не такая, 
         #записываем сумму в итог
        with open('itog.csv', 'a', newline='') as f:
            # Создаем объект writer с разделителем ","
            writer = csv.writer(f,delimiter=';')
            # Записываем данные в файл
            writer.writerow((id,mail,summ))
        keys['id'].append(id)
        keys['mail'].append(mail)
        keys['summ'].append(summ)
        id = row[0] #записываем новый ид
        summ= row[6] #обновляем сумму



# Открываем csv файл для записи с разделителем ","
with open('new.csv', 'w', newline='') as file:
    # Создаем объект writer с разделителем ","
    writer = csv.writer(file,delimiter=';')
    # Записываем данные в файл
    writer.writerows(rows)
