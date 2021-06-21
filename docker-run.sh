set -e
docker build -t unifa-task:latest .
docker run -it -p 3000:3000 -v $PWD:/app unifa-task:latest rails s -b 0.0.0.0
