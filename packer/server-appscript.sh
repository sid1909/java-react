#!/bin/sh

#httpd
sudo apt update
sudo apt install apache2 -y
sudo ufw app list
sudo ufw allow 'Apache'
sudo ufw status

sudo whoami


#git clone
#sudo git clone https://github.com/priyankachouk/jenkins-react-app.git

sudo git clone https://github.com/sid1909/java-react.git
cd java-react/react-application-emp-frontend

#sudo git clone https://github.com/tvc-ctg/java-react-app.git
#cd java-react-app/react-application-emp-frontend

#node npm
sudo apt update
sudo apt install nodejs -y
sudo apt install npm -y 

sudo npm install
ls
sudo npm i react-scripts
sudo npm run build

#sudo rm -rf /var/www/html

sudo cp -r ./build/*  /var/www/html/
cd ..

#java and maven
sudo apt update
sudo apt install default-jdk -y
sudo apt install maven -y
sudo mvn -version


#mysql
sudo apt update
sudo apt install mysql-server -y
sudo systemctl start mysql.service
#sudo mysql
echo "create database emp;" | sudo mysql
#exit


#Apache tomcat
sudo apt update
sudo wget https://archive.apache.org/dist/tomcat/tomcat-10/v10.0.8/bin/apache-tomcat-10.0.8.tar.gz
ls 
pwd
sudo tar xzvf apache-tomcat-10.0.8.tar.gz
ls
sudo mkdir /opt/tomcat/
sudo mv apache-tomcat-10.0.8/* /opt/tomcat/
sudo chown -R www-data:www-data /opt/tomcat/
sudo chmod -R 755 /opt/tomcat/

#build java
echo "###################################BUILD JAVA###############################"
ls
pwd
cd java-application-emp-backend
sudo mvn clean install -DskipTests=true
ls
pwd
cp ./target/springboot-backend-0.0.1-SNAPSHOT.jar /opt/tomcat/webapps/



ls /opt/
ls /opt/tomcat
ls /opt/tomcat/webapps/
cd ../common-config/
sudo cp server.xml /opt/tomcat/conf/server.xml
sudo cp context.xml /opt/tomcat/webapps/manager/META-INF/context.xml
sudo cp context.xml /opt/tomcat/webapps/host-manager/META-INF/context.xml
sudo sh /opt/tomcat/bin/startup.sh


