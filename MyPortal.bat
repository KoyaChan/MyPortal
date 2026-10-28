E:
cd e:\work\MyPortal

if "%1" == "-p" (
  docker run -it --name MyPortal -v e:\work\MyPortal:/usr/src/MyPortal -p 3000:3000 -e TZ=Asia/Tokyo koyachan/myportal bash -c ./production.sh
) else (
  docker run --name MyPortal -it -v e:\work\MyPortal:/usr/src/MyPortal -p 3000:3000 -e TZ=Asia/Tokyo koyachan/myportal 
)

REM docker container prune
