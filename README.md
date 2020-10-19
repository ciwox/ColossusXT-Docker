# ColossusXT-Docker
ColossusXT Docker

# Running with docker-compose
docker-compose up -d

# Stopping docker-compose
docker-compose down

# How to run without volume mapping
docker run -p 51572:51572 --name colx ciwox/colossusxt:latest

# How to run on Windows (Volume mapping from Windows host to Linux container)
docker run -p 51572:51572 -v c:/COLX/TEST:/home/colossusxt/.ColossusXT --name colx ciwox/colossusxt:latest

# How to run on Linux (Volume mapping from Linux host to Linux container)
docker run -p 51572:51572 -v /home/MYUSER/.ColossusXT:/home/colossusxt/.ColossusXT --name colx ciwox/colossusxt:latest

# How to enter container as user
docker exec -it colx /bin/bash

# How to enter container as root
docker exec -it -u 0 colx /bin/bash

# Restart container
docker restart colx

# Stop container
docker stop colx

# Remove container
docker rm colx