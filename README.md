﻿#Как запускать бэкенд на докере: пошаговная инструкция

##Первый шаг
Заходим в файл docker-compose.yml, меняем там ConnectionString на ваши данные.

##Второй шаг 
В терминале или командной строке прописываем (предварительно перейдя в корневую папку проекта)
```
docker compose build
```

##Третий шаг
```
docker compose up
```

Всё! Апи работает на порте 777 (можно сменить на какой угодно в том же самом docker-compose).