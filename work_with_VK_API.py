import sys
import codecs  
import csv
import vk_api
from vk_id import password 
from vk_api.exceptions import VkApiError
sys.stdout = codecs.getwriter("utf-8")(sys.stdout.detach())
session = vk_api.VkApi(token=password)
vk = session.get_api()

def write_to_csv(input_file, views, likes, reposts, comments):
    with open(input_file, 'a', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=['views', 'likes', 'reposts', 'comments'])
        if file.tell() == 0:
            writer.writeheader()
        writer.writerow({'views': views, 'likes': likes, 'reposts': reposts, 'comments': comments})
        row['views'] = views
        row['likes'] = likes
        row['reposts'] = reposts
        row['comments'] = comments

def post(posts):
    post = session.method('wall.getById',{'posts':posts})
    if len(post) > 0 and post[0]['text'] != "Запись удалена ":
        views = post[0]['views']['count']
        likes = post[0]['likes']['count']
        reposts = post[0]['reposts']['count']
        comments = post[0]['comments']['count']
        
        write_to_csv(input_file, views, likes, reposts, comments)
    else:
        views = 0
        likes = 0
        reposts = 0
        comments = 0
        with open(input_file, 'a', newline='') as file:
            writer = csv.DictWriter(file, fieldnames=['views', 'likes', 'reposts', 'comments'])
            if file.tell() == 0:
                writer.writeheader()
            writer.writerow({'views': views, 'likes': likes, 'reposts': reposts, 'comments': comments})
            row['views'] = 0
            row['likes'] = 0
            row['reposts'] = 0
            row['comments'] = 0
        

def video(vid):
    video_ = session.method('video.get',{'videos':vid})
    views = video_["items"][0]["views"]
    likes = video_["items"][0]['likes']['count']
    reposts = video_["items"][0]['reposts']['count']
    comments = video_["items"][0]['comments']
    
    write_to_csv(input_file, views, likes, reposts, comments)


def write_data_to_csv(input_file, rows):
    with open(input_file, 'w', newline='') as file:
        fieldnames = rows[0].keys()
        writer = csv.DictWriter(file, fieldnames=fieldnames, delimiter=';')
        writer.writeheader()
        for row in rows:
            writer.writerow(row)

input_file = 'posts.csv'
# Задайте название столбца, из которого нужно взять значения
column_name = 'Укажи ссылку на пост в источнике'
# Чтение исходного файла CSV
with open(input_file, 'r') as file:
    reader = csv.DictReader(file, delimiter=';')
    rows = list(reader)
# Обновление значений столбца и добавление нового столбца
for row in rows:
    row['views'] = None
    row['likes'] = None
    row['reposts'] = None
    row['comments'] = None

for row in rows:
    value = row[column_name]
    try:
        if len(value.split("wall")) >= 2:
            split_value = value.split("wall")
            new_value = split_value[1].split("%2")[0]
            post(new_value)
            write_data_to_csv(input_file, rows)
        elif len(value.split("clip")) >= 2:
            split_value = value.split("clip")
            new_value = split_value[1].split("%2")[0]
            video(new_value)
            write_data_to_csv(input_file, rows)
        elif len(value.split("video")) >= 2:
            split_value = value.split("video")
            new_value = split_value[1].split("%2")[0]
            video(new_value)    
            write_data_to_csv(input_file, rows)
        else:
            new_value = ""
        row['new_column'] = new_value
        # count += 1
    except:
        row['new_column'] = ""

# Запись обновленных данных в тот же файл CSV
write_data_to_csv(input_file, rows)