E:
cd e:\work\MyPortal

docker run --name MyPortal -it -v e:\work\MyPortal:/usr/src/MyPortal -p 3000:3000 -e TZ=Asia/Tokyo koyachan/myportal 
docker container prune
