# docker rm -f $(docker ps -a -q) #dell all containers forced
# docker rmi $(docker image ls -a -q) #dell all images
#!/bin/bash
echo "--------------------------"
while true; do
    read -p "Do you wish to delete all docker images and containers forced?" yn
    case $yn in
        [Yy]* ) docker rm -f $(docker container ls -a -q); docker rmi $(docker image ls -a -q); break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no (Yy/Nn)";;
    esac
done
echo "Done!"
echo "IMAGES:"
docker image ls -a
echo "CONTAINERS:"
docker container ls -a
echo "--------------------------"