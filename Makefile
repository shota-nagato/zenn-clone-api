RUN := run --rm
DOCKER_COMPOSE_RUN := docker-compose $(RUN)

setup:
	@make build
	@make dbcreate
	@make dbmigrate
	@make dbseed

build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down

bundle_install:
	${DOCKER_COMPOSE_RUN} rails bundle install

console:
	${DOCKER_COMPOSE_RUN} rails rails c

dbcreate:
	${DOCKER_COMPOSE_RUN} rails rails db:create

dbmigrate:
	${DOCKER_COMPOSE_RUN} rails rails db:migrate

dbseed:
	${DOCKER_COMPOSE_RUN} rails rails db:seed

dbreset:
	${DOCKER_COMPOSE_RUN} rails rails db:migrate:reset
	@make dbseed

rspec:
	${DOCKER_COMPOSE_RUN} rails rspec

standard:
	${DOCKER_COMPOSE_RUN} rails standardrb

standard_fix:
	${DOCKER_COMPOSE_RUN} rails standardrb --fix
