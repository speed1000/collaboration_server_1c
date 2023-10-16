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
6. Развернуть и запустить стек из cs.yml.
7. Зайти в контейнер db и выполнить:
  ```
  su postgres
  psql
  \c cs_db
  CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
  \q
  ```
8. Зайти в контейнер cs и выполннить:
  ```
   curl -Sf -X POST -H "Content-Type: application/json" -d "{ \"url\" : \"jdbc:postgresql://db:5432/cs_db\", \"username\" : \"postgres\", \"password\" : \"postgres\", \"enabled\" : true }" -u admin:admin http://localhost:8087/admin/bucket_server
  ```
9. Перезапустить и проверить, что логи впорядке. По умолчанию выводятся из /var/cs/cs_instance/logs/server.log, так как основные проблемы появляются там.
