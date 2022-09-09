sudo yum update -y
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
terraform -help
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
sudo yum -y update && sudo yum -y install terraform
sudo yum install -y yum-utils
clear
sudo systemctl stop jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
getent passwd
sudo su - jenkins -s /bin/bash
sudo yum install openjdk-11-jre
sudo yum install openjdk-*
sudo amazon-linux-extras uninstall java-openjdk11
sudo wget -O /etc/yum.repos.d/jenkins.repo     https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
# Add required dependencies for the jenkins package
sudo yum install java-11-openjdk
sudo yum install jenkins
sudo yum remove java*
sudo yum install java-11-openjdk
sudo systemctl restart jenkins
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
yum --disablerepo=hashicorp
 yum-config-manager --disable hashicorp
sudo yum-config-manager --disable hashicorp
sudo yum -y install terraform
terraform -v
terraform 
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
terraform status
terraform state
ls
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
sudo amazon-linux-extras install java-openjdk11
sudo yum install java-1.8.0-openjdk
java -version
sudo wget -O /etc/yum.repos.d/jenkins.repo     https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install jenkins -y
sudo systemctl enable jenkins --now
sudo systemctl status jenkins
sudo systemctl start jenkins
sudo systemctl stop jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl stop jenkins
sudo systemctl disable jenkins
sudo systemctl status jenkins
sudo systemctl restart jenkins
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
ps -aux
ps -aux | grep jenkins
kill 9709
kill -p 9709
sudo kill -9 9709
ls
sudo systemctl status jenkins
        sudo systemctl stop jenkins 
sudo systemctl status jenkins 
sudo systemctl status jenkins java -c
ja -v
java -v
java -version
history | grep amazon
sudo yum install java -y
sudo yum -y update

sudo systemctl status jenkins 
sudo systemctl enable jenkins 
sudo systemctl status jenkins 
cat 
cat /var/lib/jenkins/secrets/initialAdminPassword
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
aws configure
l
ls
pwd
mkdir orch
cd orch/
mkdir t1 t2 t3
cd /var/lib/jenkins/
ls
ls wor
ls wor*
exit
