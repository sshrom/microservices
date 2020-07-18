# DevOps practice: Microservice architecture
monitoring-2

- cAdvisor
- Grafana


monitoring-1

- prometheus: запуск, конфигурация, знакомство с web ui
- Мониторинг состояния микросервисов
- node-exporter для сбора информации Docker-хоста

github-ci-1

- Инсталляцию Gitlab CI (Omnibus) на GCE в Docker-контейнер
- Установка и регистрация runner
- Подготовка репозитория с кодом приложения (reddit)
- Опиание этапов пайплайна gitlab-ci.yml
- Определение окружения


docker-4

- Работа с сетями в Docker
- Использование инструмента docker-compose


docker-3

- Запуск и работа приложения на основе Docker-образов
- Приложение состоит из нескольких компонентов
- Оптимизация работы Docker-образов, использование меньшее количество слоёв 


docker-2

- Установка docker-machine 
- Создание окружения docker host на платформе GCP
- Работа с Dockerfile
- Сборка своего образа reddit (ruby, puma, mongodb) Монолит 


docker-1

Контейнер можно сохранить для дальнейшего использования в образ (docker commit).
Docker не запускает сам образ, он берет образ в качестве шаблона и создает из него контейнер, запускает `docker run`.
У контейнера есть доступный для записи "верхний слой".

Различие docker inspect <u_container_id> от docker inspect <u_image_id> в том, что
Docker берет образ, добавляет доступный для записи верхний слой и инициализирует различные параметры, такие как
сетевые порты, имя контейнера, идентификатор и лимиты ресурсов.

docker ps # Список запущенных контейнеров
docker container ls
docker ps -a # Список всех контейнеров
docker images # Список сохранненных образов
docker image ls
docker run = docker create + docker start # (+ docker attach в случае с -i)
docker run -it ubuntu:16.04 bash # запустить контейнер с образом ubuntu
-i # запускает контейнер в foreground режиме (docker attach)
-d # запускает контейнер в background режиме
-t # создает TTY
docker history # Показывает историю создания image, слои образа и какие команды использовались
docker commit fa69558839f0 tryimage/nginx-tmp-file # Создает image из контейнера, контейнер остается запущенным
docker kill $(docker ps -q) # убить все запущенные контейнеры
docker system df # Отображает сколько дискового пространства занято
rm # удаляет контейнер; rmi # удаляет image
docker rm $(docker ps -a -q) # удалит все незапущенные контейнеры
docker ps --filter "status=exited" # выводит список остановленных контейнеров
