# Rentoy - Backend (A API)

![Python](https://img.shields.io/badge/Python-3.11+-3776AB?logo=python&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-0.100+-009688?logo=fastapi&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-4169E1?logo=postgresql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-20.10+-2496ED?logo=docker&logoColor=white)
![Pytest](https://img.shields.io/badge/Pytest-7.0+-0A9EDC?logo=pytest&logoColor=white)

Este é o repositório backend do projeto Rentoy, um Micro-SaaS para gerenciamento de empresas de locação de brinquedos.

Esta API é o "cérebro" do sistema, responsável por toda a lógica de negócio, regras de disponibilidade (evitando overbooking), gerenciamento financeiro e persistência de dados. Ela é consumida pelo [rentoy-frontend](https://github.com/jglucian0/rentoy-saas-app).

## O Problema

Este projeto nasceu da necessidade real que eu vinha enfrentando como locador de brinquedos infláveis. O objetivo é criar uma solução pragmática e robusta, que fosse simples e intuitiva para gerenciar:

- Cadastro de Brinquedos, Clientes e Funcionários.
- Agenda de locações, com verificação de disponibilidade em tempo real.
- Controle financeiro simples (lançamentos de entrada e saída).
- Um dashboard para visualizar parâmetros estastísticos da empresa.

## Arquitetura e Filosofia

Seguimos uma abordagem pragmática, focada em **Clean Code** e **TDD (Test-Driven Development)**.

- **Clean Architecture (Simplificada):** O código é separado em camadas. As regras de negócio puras (ex: `check_availability`) vivem no `domain` e não sabem nada sobre a web ou o banco de dados. A camada de `api` (FastAPI) orquestra as requisições, e a camada de `models` (SQLAlchemy) cuida da persistência.
- **TDD (Pytest):** As regras de negócio críticas (como disponibilidade) são escritas primeiro como testes, garantindo que o coração do sistema seja à prova de falhas.

## Stack Tecnológica

- **Framework:** FastAPI
- **Banco de Dados:** PostgreSQL
- **ORM:** SQLAlchemy
- **Migrations:** Alembic
- **Testes:** Pytest
- **Containerização:** Docker e Docker Compose

---

## 🚀 Como Começar (Ambiente de Desenvolvimento)

Este projeto é configurado para rodar inteiramente dentro de containers Docker, facilitando o setup.

### 1. Pré-requisitos

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

### 2. Clonar o Repositório

```bash
git clone https://github.com/jglucian0/rentoy-saas-api.git
cd rentoy-backend
```

### 3. Variáveis de Ambiente

```bash
# Crie um arquivo .env na raiz do projeto, copiando o .env.example
# Ele já vem pré-configurado para o banco de dados do Docker Compose.
cp .env.example .env
```

### 4. Subir os Containers

```bash
# Este comando irá construir as imagens e iniciar o serviço da API (`app`)
# e o serviço de banco de dados (`db`) em background (-d).
docker-compose up -d --build
```

### 5. Rodar as Migrations

```bash
# Com os containers em execução, crie as tabelas no banco de dados
# executando o Alembic dentro do container `app`.
docker-compose exec app alembic upgrade head
```

### 6. Pronto! A API estará em execução e acessível em:

- **API:** http://localhost:8000
- **Documentação Interativa (Swagger):** http://localhost:8000/docs

---

## 🧪 Rodando os Testes

```bash
# Execute a suíte de testes (Pytest) dentro do container `app`.
docker-compose exec app pytest
```

## 📚 Estrutura do Projeto

```bash
.
├── alembic/         # Arquivos de migration do Alembic
├── src/
│   ├── api/         # Endpoints FastAPI (rotas)
│   ├── core/        # Configurações (ex: conexão com DB)
│   ├── domain/      # Regras de negócio puras (ex: check_availability)
│   ├── models/      # Modelos de dados (SQLAlchemy)
│   └── schemas/     # Schemas Pydantic (validação de dados)
└── tests/           # Testes (Pytest)
```
