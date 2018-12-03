docker run --name MyPortal -it -v ~/MyPortal:/usr/src/MyPortal -p 3000:3000 -e TZ=Asia/Tokyo koyachan/MyPortal
docker container prune
