#!/bin/bash

# Author : Kapedo

# Installation et configuration de SonarQube on CentOS 7 #

# Sonarqube doesnt work when you start it as root user #

   su - vagrant

#  Java 11 installation #

    sudo yum update -y

    sudo yum install java-11-openjdk-devel -y

    sudo yum install java-11-openjdk -y

#  Download SonarQube latest versions on your server #

#  Let’s navigate to the /opt directory before downloading #

    cd /opt

    sudo yum install wget -y

      sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/so      narqube-9.3.0.51899.zip

# Extract packages #

     sudo yum install unzip -y

     sudo unzip /opt/sonarqube-9.3.0.51899.zip

#  Change ownership to the user # 

   sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899

# Switch to Linux binaries directory to start service

  cd /opt/sonarqube-9.3.0.51899 /bin/linux-x86-64 
  
  cd /opt/sonarqube-9.3.0.51899 /bin/linux-x86-64 

# Start the service #

 ./sonar.sh start


if [$? -ne=0]
then
     echo " Sonarqube is successifully installed "
else
   echo " Sonarqube is  "
fi

sleep 3

# Connect to the SonarQube server through the browser

echo " opening of port to cnnect sonaqube to the server"
sudo firewall-cmd --permanent --add-port=9000/tcp


if [$? -ne=0]
then
     echo "Firewall is inactive "

     echo " starting and enabling of firewall"
     systemctl enable firewalld
     echo " ga ahead enter (vagrant) as password "
       read v
        s=vagrant
          for [${v} != ${s} ]
           do
             echo "password incorrect"

              systemctl enable firewalld
               echo " ga ahead enter (vagrant) as password "
            done
systemctl start firewalld
         echo " ga ahead enter (vagrant) as password "
         read sv
          ss=vagrant
          for [${sv} != ${ss} ]
           do
             echo "password incorrect"

              systemctl enable firewalld
               echo " ga ahead enter (vagrant) as password "
            done
 fi

sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload