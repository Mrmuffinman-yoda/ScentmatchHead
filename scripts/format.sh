cd server
ruff format .
black -l 88 .
cd ..
cd ui
npx prettier . --write