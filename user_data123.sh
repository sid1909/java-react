#!/bin/bash
echo "##############user-data##############"
cd /home/ubuntu/java-react/java-application-emp-backend/target
sudo java -jar -Dserver.port=8000 app.jar