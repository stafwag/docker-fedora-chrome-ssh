sudo docker run --privileged -d -p 127.0.0.1:8022:22 --name "mychrome" stafwag/docker-fedora-chrome-ssh
sleep 1
ssh -X mychrome google-chrome --no-default-browser-check
sudo docker kill samwag_mychrome
sudo docker rm samwag_mychrome
