pipeline {
  agent any
	
      stages {
	     stage('AMI creation') {  
	  steps {
          sh 'packer --version'
		  sh 'ls'
		  sh 'sudo packer build -var-file=./packer/vars.json ./packer/packer.json'
          }
       }
      }
 }
