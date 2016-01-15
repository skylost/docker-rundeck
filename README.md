# docker-rundeck
Docker image for rundeck

## Build

    git clone https://github.com/skylost/docker-rundeck.git
    docker build -t skylost/rundeck .

## Run

    docker run -d -p 4440:4440 -p 4443:4443 --env RDPASS=admin --name rundeck skylost/rundeck 

## Usage
