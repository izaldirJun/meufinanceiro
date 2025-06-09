up:
	docker-compose up -d

down:
	docker-compose down

artisan:
	docker exec -it meufinanceiro_app php artisan $(CMD)

composer:
	docker exec -it meufinanceiro_app composer $(CMD)
