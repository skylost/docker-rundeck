#!/bin/bash


#docker run -d -p 4440:4440 -p 4443:4443 --env RDPASS=admin --name rundeck weezhard/rundeck

docker run -d --env RDPASS=admin@RUNDECK \
              --env RDHOST=rundeck.labohome.int \
              --env RDPORT=80 \
              --env VIRTUAL_HOST=rundeck.labohome.int \
              --name rundeck weezhard/rundeck
