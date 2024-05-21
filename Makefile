.PHONY: up

APPS = accounts config core
NEWAPP = new_app
PACKAGE = $(PACKAGE)

up:
	docker compose -f docker-compose.yaml up

build:
	docker compose -f docker-compose.yaml up --build

buildd:
	docker compose -f docker-compose.yaml up --build -d

migrate:
	docker compose run backend python manage.py makemigrations
	docker compose run backend python manage.py migrate

shell:
	docker compose run backend python manage.py shell

dbbash:
	docker compose run backend python manage.py dbshell

bash:
	docker compose exec backend bash

superuser:
	docker compose run backend python manage.py createsuperuser

newapp:
	echo "Set $NEWAPP ENV as the name: make newapp NEWAPP=<NAME>"
	docker compose run backend python manage.py startapp $(NEWAPP)

# TODO: Fix this
install:
	docker compose run backend pip install $(PACKAGE)
	docker compose run backend pip freeze > requirements.txt

# TODO: Fix this.
prune:
	docker compose down
	docker network prune -f
	docker volume prune -f
	docker system prune -a -f
	docker compose -f docker-compose.yaml down -v --rmi all
	docker volume rm -f $(shell docker volume ls)

ps:
	docker ps

psa:
	docker ps -a

logs:
	docker compose logs -f