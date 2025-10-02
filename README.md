# Microservices and Web Engineering: Checkpoint 04

Este repositório contém o projeto desenvolvido para o Checkpoint da matéria de **Microservices and Web Engineering** do 3º semestre de Análise e Desenvolvimento de Sistemas.

**Professor:** Antonio Carlos de Lima Júnior

## Integrantes do Grupo

- `José Roberto Claudino Ferreira - RM552407`
- `Nicolas Machado - RM552493`

---

## 🚀 Sobre o Projeto

O objetivo deste projeto foi aplicar os conceitos de um container docker em um projeto **Java com Spring Boot** que acessa um banco de dados, e empacotar toda a solução em contêineres utilizando Docker.

A arquitetura é composta por dois serviços principais, orquestrados pelo Docker Compose:

1.  **API**: O back-end da aplicação construído em Spring Boot.
2.  **Banco de Dados**: O sistema de gerenciamento de banco de dados (MySQL) para persistência dos dados.

### ✔️ Atividades Realizadas

- [x] **Dockerfile**: Criação do `Dockerfile` para conteinerizar a aplicação Spring Boot.
- [x] **Docker Compose**: Criação do arquivo `docker-compose.yml` para definir e executar os serviços da API e do Banco de Dados de forma integrada.
- [x] **Docker Hub**: Publicação da imagem Docker da aplicação no Docker Hub.
- [x] **Documentação**: Elaboração deste `README.md` com as instruções de execução do projeto.

---

## 🛠️ Tecnologias Utilizadas

- **Java & Spring Boot**: Desenvolvimento da API REST.
- **MySQL**: Banco de Dados relacional.
- **Maven**: Gerenciamento de dependências e build do projeto.
- **Docker & Docker Compose**: Conteinerização e orquestração dos serviços.
- **Swagger (Springdoc)**: Documentação interativa da API.

---

## ⚙️ Pré-requisitos

Antes de começar, certifique-se de ter as seguintes ferramentas instaladas em sua máquina:

- [**Docker Engine**](https://docs.docker.com/engine/install/)
- [**Docker Compose**](https://docs.docker.com/compose/install/)

---

## ▶️ Como Executar a Aplicação

Existem duas maneiras de executar este projeto. A forma recomendada e mais simples é utilizando o Docker Compose.

### 1. Execução com `docker-compose` (Necessário baixar o projeto)

Este método irá construir a imagem da API (se não existir localmente), baixar a imagem do banco de dados e iniciar os dois contêineres de forma integrada e já conectados.

1.  **Clone o repositório:**

    ```bash
    git clone https://github.com/Soraaslon/3SIR-Checkpoint_04-Micro_Services
    ```

2.  **Navegue até o diretório do projeto:**

    ```bash
    cd 3sir-checkpoint_04-micro_services
    ```

3.  **Execute o Docker Compose:**

    ```bash
    docker-compose up -d
    ```

    _O comando `-d` (detached) executa os contêineres em segundo plano._

4.  Pronto! A aplicação e o banco de dados já estão rodando. Para parar todos os serviços, execute `docker-compose down` no mesmo diretório.

### 2. Execução com `docker run` (Usando a Imagem do Docker Hub)

> Comando em linha única para permitir o uso em um CMD.

1. Criar e subir o container do MySQL (exemplo):

```bash
docker run -d --name db --rm -e MYSQL_ROOT_PASSWORD=root_pwd -e MYSQL_USER=new_user -e MYSQL_PASSWORD=my_pwd -p 3306:3306 mysql
```

2. Rodar a API a partir da imagem publicada no Docker Hub:

```bash
docker run --name api -e SPRING_DATASOURCE_URL="jdbc:mysql://host.docker.internal:3306/db_microservices?createDatabaseIfNotExist=true&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC" -p 8080:8080 soraaslon/3sir-checkpoint_04-micro_services
```

---

---

## 📖 Acessando a Aplicação

Após iniciar os contêineres por qualquer um dos métodos acima, a aplicação estará disponível nos seguintes endereços:

- **API Base URL**: `http://localhost:8080`
- **Swagger UI (Documentação)**: `http://localhost:8080/swagger-ui/index.html`

Através do Swagger UI, é possível visualizar todos os endpoints disponíveis na API, seus parâmetros e respostas, além de testá-los diretamente pelo navegador.

---

## 🔗 Links dos Repositórios

- **Repositório GitHub:** `https://github.com/soraaslon/3sir-checkpoint_04-micro_services`
- **Repositório Docker Hub:** `https://hub.docker.com/r/soraaslon/3sir-checkpoint_04-micro_services`
