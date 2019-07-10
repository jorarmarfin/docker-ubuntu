docker build -t jorarmarfin/ubuntu:tmp . 
docker build -t jorarmarfin/ubuntu:16.04-supervisor . 

docker run --name srv-ubuntu -p 9005:9001 -dit jorarmarfin/ubuntu:tmp