up:
	./start.sh

up-direct:
	docker-compose up -d

down:
	docker-compose down
	
env:
	cp .env.example .env

bash:
	docker exec -it meufinanceiro_app bash

.PHONY: start composer key artisan

# Instalar dependências composer dentro do container Laravel
composer:
	docker exec meufinanceiro_app composer install --no-interaction --prefer-dist --optimize-autoloader

# Gerar APP_KEY do Laravel
key:
	docker exec meufinanceiro_app php artisan key:generate

# Rodar comandos artisan dentro do container Laravel
artisan:
	docker exec -it meufinanceiro_app php artisan $(CMD)

# Start: instala dependências e gera a chave
start: composer key

# Rodar migrations
migrate:
	docker exec -it meufinanceiro_app php artisan migrate

# Rodar seeders
seed:
	docker exec -it meufinanceiro_app php artisan db:seed

# Instalar projeto Laravel (composer install + key + migrate + seed)
install:
	make composer CMD="install"
	make key
	make migrate
	make seed