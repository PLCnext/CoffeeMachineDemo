#!/bin/sh

# THIS SCRIPT INSTALLS SOFTWARE COMPONENTS FOR A SALES DEMO APPLICATION

# Function to check successful command execution
checkCommand(){ #

	if [ $? -eq 0 ]; then #
		echo -e "\e[1;32m >> Step $1 / 5 successfully done :) \e[0m \n" #
	else #
		echo -e "\e[1;31m >> Installation was not successful\e[0m \n" #
		exit #
	fi #

}

# Steps for installation
echo -e '\e[1;32m ----------------------------------------------------------------------------- \e[0m' #
echo -e "\033[1;33;40m >> Installation started \e[0m" #
echo -e '\e[1;32m ----------------------------------------------------------------------------- \e[0m' #

# Install the Python package manager PIP
echo -e '\e[1;35m >> Step 1 - Install Python package manager PIP \e[0m \n' #
sudo -H -u admin bash -c "curl -k https://bootstrap.pypa.io/get-pip.py -o get-pip.py" #
sudo -H -u admin bash -c "python3 get-pip.py" #
checkCommand 1 #

# Install the 'requests' library for Python
echo -e "\e[1;35m >> Step 2 - Install 'requests' library via PIP \e[0m \n" #
sudo -H -u admin bash -c "python3 -m pip install requests" #
checkCommand 2 #

# Add Python script to auto start
echo -e "\e[1;35m >> Step 3 - Add Python script to autostart \e[0m \n" #
sudo -H -u admin bash -c "(crontab -l 2>/dev/null; echo '@reboot /usr/bin/python3 /opt/plcnext/projects/PCWE/Services/Ehmi/ehmi/ProvideDatabase.py') | crontab - " #
checkCommand 3 #

# Install Node-RED as Docker container
echo -e "\e[1;35m >> Step 4 - Install Node-RED \e[0m \n" #
sudo -H -u admin bash -c 'mkdir node_red_user_data' #
sudo -H -u admin bash -c 'chmod 777 /opt/plcnext/node_red_user_data' #
sudo -H -u admin bash -c '/opt/plcnext/appshome/bin/balena-engine volume create --name node_red_user_data' #
sudo -H -u admin bash -c '/opt/plcnext/appshome/bin/balena-engine run -d -it --restart always -p 1880:1880 -v /opt/plcnext/node_red_user_data:/data --name mynodered nodered/node-red' #
checkCommand 4 #

# Install Node-RED nodes
echo -e "\e[1;35m >> Step 5 - Install Node-RED nodes \e[0m \n" #

for (( i=1; i<=20; i++ )); do #
	
	cmd=("curl" "-s" "http://localhost:1880") #
	op=$("${cmd[@]}") #
	
	if [[ -n $op ]]; then #
		echo -e "Node-RED is ready" #
		echo -e "email nodes will be installed >> Please wait ..." #
		sudo -H -u admin bash -c '/opt/plcnext/appshome/bin/balena-engine exec -i mynodered node-red-admin install node-red-node-email' #
		echo -e "opc-ua nodes will be installed >> Please wait ..." #
		sudo -H -u admin bash -c '/opt/plcnext/appshome/bin/balena-engine exec -i mynodered node-red-admin install node-red-contrib-opcua' #
		echo -e "ui-table nodes will be installed >> Please wait ..." #
		sudo -H -u admin bash -c '/opt/plcnext/appshome/bin/balena-engine exec -i mynodered node-red-admin install node-red-node-ui-table' #
		echo -e "moment nodes will be installed >> Please wait ..." #
		sudo -H -u admin bash -c '/opt/plcnext/appshome/bin/balena-engine exec -i mynodered node-red-admin install node-red-contrib-moment' #
		echo -e "dashboard nodes will be installed >> Please wait ..." #
		sudo -H -u admin bash -c '/opt/plcnext/appshome/bin/balena-engine exec -i mynodered node-red-admin install node-red-dashboard' #
		echo -e "ui-actions nodes will be installed >> Please wait ..." #
		sudo -H -u admin bash -c '/opt/plcnext/appshome/bin/balena-engine exec -i mynodered node-red-admin install node-red-contrib-ui-actions' #
		checkCommand 5 #
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

echo -e '\e[1;32m ----------------------------------------------------------------------------- \e[0m' #
echo -e "\033[1;33;40m >> Installation finished \e[0m" #
echo -e '\e[1;32m ----------------------------------------------------------------------------- \e[0m' #
