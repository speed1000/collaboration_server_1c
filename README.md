# 1С:Сервера взаимодействия
Данная сборка использовалась для запуска сервера взаимодействия в docker swarm.

## Источники
https://its.1c.ru/db/v8311doc/content/232/hdoc
https://its.1c.ru/db/metod8dev/content/5988/hdoc
https://github.com/asdaru/collaboration_server_1c
https://nizamov.school/ustanovka-servera-vzaimodejstviya-1s-v-docker/

## Запуск
1. Скачать исходники с сайта users (например 1c_cs_24.0.29_linux_x86_64.tar.gz).
2. Клонировать себе репозиторий и поместить скаченный файл в папку.
3. Изменить Dockerfile под имя файла нового релиза сервера взаимодействия.
4. Изменить переменную DOCKER_REGISTRY_URL в build.sh.
5. Выполнить
  ```
  sh build.sh
  ```
6. Равзернуть стек из cs.yml.
7. Зайти в контейнер с postgres и выполнить:
  ```
  sh build.sh
  ```   
