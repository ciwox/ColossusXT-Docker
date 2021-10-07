# ColossusXT-Docker
ColossusXT Docker


# Easy Deploy - !! Do not forget to edit the ColossusXT.conf file inside the folder.
```sh
git clone https://github.com/ciwox/ColossusXT-Docker.git
cd ColossusXT-Docker
docker-compose pull
docker-compose up -d
```

# Running with docker-compose
```sh
docker-compose up -d
```

# Stopping docker-compose
```sh
docker-compose down
```

# Pull the latest image
```sh
docker pull ciwox/colossusxt
```

# How to run without volume mapping
```sh
docker run -p 51572:51572 --name colx ciwox/colossusxt:latest
```

# How to run on Windows (Volume mapping from Windows host to Linux container)
```sh
docker run -p 51572:51572 -v c:/COLX/TEST:/home/colossusxt/.ColossusXT --name colx ciwox/colossusxt:latest
```

# How to run on Linux (Volume mapping from Linux host to Linux container)
```sh
docker run -p 51572:51572 -v /home/MYUSER/.ColossusXT:/home/colossusxt/.ColossusXT --name colx ciwox/colossusxt:latest
```

# How to enter container as user
```sh
docker exec -it colx /bin/bash
```

# How to enter container as root
```sh
docker exec -it -u 0 colx /bin/bash
```

# Restart container
```sh
docker restart colx
```

# Stop container
```sh
docker stop colx
```
# Remove container
```sh
docker rm colx
```
