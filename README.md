# MeuFinanceiro

MeuFinanceiro é um sistema de acompanhamento e gerenciamento financeiro pessoal, construído com Laravel, PostgreSQL e Docker. Pode ser executado localmente ou hospedado via web.

## 📆 Tecnologias Utilizadas

* [Laravel 11](https://laravel.com/) (PHP 8.3)
* [PostgreSQL 16](https://www.postgresql.org/)
* [Nginx (Alpine)](https://hub.docker.com/_/nginx)
* [Docker + Docker Compose](https://docs.docker.com/compose/)

## ⚙️ Instalação Rápida

### 1. Clone o repositório

```bash
git clone https://github.com/seunome/meufinanceiro.git
cd meufinanceiro
```

### 2. Copie o arquivo de ambiente e edite se necessário

```bash
cp .env.example .env
```

### 3. Suba os containers com Docker Compose

```bash
docker-compose up -d
```

### 4. Instale as dependências do Laravel

```bash
docker exec -it laravel-app bash
composer install
php artisan key:generate
php artisan migrate
exit
```

### 5. Acesse o sistema

Abra [http://localhost:8000](http://localhost:8000) no navegador.

## 🚀 Comandos Rápidos (via Makefile)

* `make up`: Sobe os containers
* `make artisan CMD="migrate"`: Roda comandos artisan
* `make down`: Para os containers

## 🌐 Acesso ao Banco de Dados

* **Host:** `localhost`
* **Porta:** `5432`
* **Usuário:** `finance_user`
* **Senha:** `finance_pass`

## 💼 Licença

Este projeto está licenciado sob a Licença MIT. Consulte o arquivo `LICENSE` para mais informações.

## ✨ Contribuindo

Pull Requests são bem-vindos! Para grandes mudanças, abra uma issue primeiro para discutirmos o que você gostaria de modificar.

## ✉️ Contato

Para sugestões ou dúvidas: [seuemail@exemplo.com](mailto:seuemail@exemplo.com)

---

> Desenvolvido com ❤️ para ajudar no controle financeiro pessoal.
