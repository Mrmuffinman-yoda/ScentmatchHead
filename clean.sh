# file to clean up node_modules and package-lock.json
# .next 

cd ui
rm -rf node_modules
rm -rf package-lock.json
rm -rf .next
cd ..
cd server/app
find . -type d -name "__pycache__" -exec rm -rf {} +