#!/bin/bash
sudo apt update
echo "------------------------------package updated----------------------------------"
rm -rf /usr/local/bin/gitlab-runner
echo "-------------------------------------file removed---------------------------------"
sudo curl -L --output /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64
echo "------------------------------------runner package downloaded-------------------------------------"
sudo chmod +x /usr/local/bin/gitlab-runner
echo 
echo "-----------------------------------giveing permission to runner----------------------------------"
id -u gitlab-runner &>/dev/null || sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash
echo "---------------------------------checked user ----------------------------------------"
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner
echo "--------------------------------------installed runner------------------------------------"
sudo gitlab-runner start

echo "---------------------------Completed gitlab-runner installation------------------------------------"

echo "--------------------------- initated docker installation ------------------------------------"

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo systemctl enable --now docker

echo "--------------------------- completed docker installation ------------------------------------"