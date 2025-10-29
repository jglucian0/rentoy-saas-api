.PHONY: up build-up down

# Sobe os contêineres (API + DB)
up:
	docker-compose up

# Sobe os contêineres e força a reconstrução da imagem
build-up:
	docker-compose up --build

# Desliga e remove os contêineres
down:
	docker-compose down

# Reconstrói a imagem sem subir
build:
	docker-compose build