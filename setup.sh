#!/bin/bash

# THIS SCRIPT INSTALLS SOFTWARE COMPONENTS FOR A SALES DEMO APPLICATION

# Function to check successful command execution
checkCommand(){ #

	if [ $? -eq 0 ]; then #
		echo -e "\e[1;32m >> Step $1 / 4 successfully done :) \e[0m \n" #
	else #
		echo -e "\e[1;31m >> Installation was not successful\e[0m \n" #
		exit #
	fi #

}

# Header
echo -e '\e[1;32m ----------------------------------------------------------------------------- \e[0m' #
echo -e "\033[1;33;40m >> Installation started \e[0m" #
echo -e '\e[1;32m ----------------------------------------------------------------------------- \e[0m' #

# Create Node-RED container
echo -e '\e[1;35m >> Step 1 - Creation of the Node-RED container \e[0m \n' #
mkdir /opt/plcnext/node_red_user_data #
chmod 0777 /opt/plcnext/node_red_user_data #
podman volume create node_red_user_data #
podman run -d -p 1880:1880 --volume /opt/plcnext/node_red_user_data:/data --name nodered docker.io/nodered/node-red #
checkCommand 1 #

# Autostart Node-RED
echo -e '\e[1;35m >> Step 2 - Autostart Node-RED \e[0m \n' #
podman generate systemd --name nodered -f #
mv container-nodered.service /etc/systemd/system #
systemctl daemon-reload #
systemctl enable container-nodered.service
checkCommand 2 #

# Install Node-RED packages
echo -e '\e[1;35m >> Step 3 - Install Node-RED packages \e[0m \n' #

for (( i=1; i<=20; i++ )); do #
	
	cmd=("curl" "-s" "http://localhost:1880") #
	op=$("${cmd[@]}") #
	
	if [[ -n $op ]]; then #
		echo -e "Node-RED is ready" #
		echo -e "ui-table nodes will be installed >> Please wait ..." #
		podman exec -i nodered node-red-admin install node-red-node-ui-table #
		echo -e "dashboard nodes will be installed >> Please wait ..." #
		podman exec -i nodered node-red-admin install node-red-dashboard #
		checkCommand 3 #
		break
	else #
		if [ $i -ne 20 ]; then #
			echo  -e "Try $i / 20 Node-RED is not ready yet >> Please wait ..." #
			sleep 10 #
		else #
			echo -e "\e[1;31m >> Installation was not successful\e[0m \n" #
			exit #
		fi #
	fi #
done #

# Autostart Python application
echo -e '\e[1;35m >> Step 4 - Autotart Python script \e[0m \n' #
mv myscript.service /etc/systemd/system #
systemctl daemon-reload #
systemctl enable myscript.service
checkCommand 4 #

echo -e '\e[1;32m ----------------------------------------------------------------------------- \e[0m' #
echo -e "\033[1;33;40m >> Installation finished \e[0m" #
echo -e '\e[1;32m ----------------------------------------------------------------------------- \e[0m' #