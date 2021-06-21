set -e
docker build -t unifa-task:latest .
docker run -it -v $PWD:/app unifa-task:latest /bin/bash
