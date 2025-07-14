# 🚀ScentMatchHead

This is the main orchestrator repo for the ScentMatch project. It brings together everything needed to run the full app stack.
To run the program first clone the repo then run


## Requirements ⚙️
- Docker
- Nodejs
- pnpm


## 🔨Getting Started

### 1. Clone the repo
```bash
git clone <this-repo-url>
cd ScentMatchHead
```
### 2. Initialise the project

```bash
./manage boot
```

This will pull the latest versions of ScentMatchUI and ScentMatchServer

## 🚦Running the App

```bash
./manage prod
```
- Runs 3 instances of the Next.js frontend

- Load-balanced via Nginx

- No hot reload

- Ideal for deployment scenarios




```bash
./manage dev
```
- 1 instance of Next.js with hot reload

- FastAPI backend also supports hot reload

- Perfect for local dev

```bash
./manage test
```

- Runs all unit tests on the FastAPI server

- Useful for CI/CD pipelines or manual testing

## 📦 Tech Stack

Each environment includes:

- MinIO – for blob storage

- Redis – for caching database queries

All environments have their own docker-compose files, each configured with specific environment variables and secrets.

`./manage prod` -> This is used to run production version of the app, nextjs won't hot reload and there are three instances of nextjs with an nginx infront of it for load balancing

`./manage dev` -> This is used for development purposes only, has only 1 instance of nextjs and supports hot reload for both fastapi server and nextjs server

`./manage test` -> This is used for running the unittests on the fastapi server
`./manage clean` -> cleans up files associated with the project including docker images

All environments have an instance of minio for blob storage and redis cache for caching db requests. 

Each of the environments have their own corresponding docker-compose files which contain env variables and secrets.
