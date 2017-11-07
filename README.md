Instalar e executar
===

Descrições de instalação e execução do sistema.

A aplicação usa:

- Ruby na versão 2.4.1
- docker para executar o banco de dados no ambiente de desenvoldimento
- PostgreSQL
- Rails 5.1.4

Instalar
---
- Instalar RVM - https://rvm.io/rvm/install
- Instalar docker - https://docs.docker.com/engine/installation/
- Instalar docker compose - https://docs.docker.com/compose/install/#install-compose

Executar
---
Após a instalação execute:
```
$ rvm install 2.4.1
$ rvm use 2.4.1
$ docker-compose -f stack.dev.database.yml up -d
$ bundle install
$ bundle exec rails db:create
$ bundle exec rails db:setup
$ bundle exec rails server
```
Consumir API em `localhost:3001` conforme a documentação em https://swaggerhub.com/apis/abnercarleto/xy-inc/1.0.0

Para parar o banco de dados execute:
```
$ docker-compose -f stack.dev.database.yml stop
```
