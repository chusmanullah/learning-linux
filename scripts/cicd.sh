#this program is written for simple CICD pipeline using github actions
# name property is used to name our project
name: Build and Deploy jar to edh_bdr edge-node
# do the action one
on:
	push:
		branches:[release]
		
# here we mention what operating system job should be runing on

# a list of supported OS is found on follwing URL
# https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners#supported-runners-and-hardware-resources
#step 1 - download copy of repo on runner
#step 2 - specify the correct java version
#step 3 - runs the Maven package command
#step 4 - lists the current directory
#step 5 - moves to target directory and list all content of target directory
#step 6 - uploads the applications jar file to target
# 		- we use scp "Secure copy protocol" to copy files | FTP can also be used
# 		- we use provided values in secrets | port number | "jar file name" | "target folder string"
jobs:
	build:
	runs-on: ubuntu-latest

	steps:
	 - name: step1 - checkout from github
	 - uses: actions/checkout@v2
	 - name: step2 - specify correct java version
	   uses: actions/setup-java@v1
	   with:
	     java-version: 1.8
	 - name: step 3 - Build the maven project
		run: mvn -B package --file pom.xml
	 - name: step 4 - List the current directroy
run: ls -a

	- name: step 5 - move to target directory
	  run: |
         cd target
         ls -action
    - name: step 6 - upload application
      uses: appleboy/scp-action@master
      with:
         host: ${{secrets.SERVER_IP_ADDRESS}}
         username: ${{secrets.SERVER_USERNAME}}
         key: ${{secrets.SERVER_SSH_KEY}}
         port: 22
         source: "jar-file-name.jar"
         target: "~/target-folder"
