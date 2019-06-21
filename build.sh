docker build -t jorarmarfin/ubuntu:16.04 . 

docker run --name srv-ubuntu -p 86:80 -dit jorarmarfin/ubuntu:16.04