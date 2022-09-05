# CoffeeMachineDemo
In this repository you can find a demo project where different features of PLCnext Control are combined.

## Introduction

This demo application shows the diversity and openness of the open control platform PLCnext Technology using the example of a coffee machine control.

Using a visualization, which is provided via the embedded web server of PLCnext Control, explanations are given as well as some different possibilities of programming can be experienced.

![Alt-Text](images/coffee_machine.PNG)


## Requirements

### Hardware
- Computer with Microsoft Windows operating system
- PLCnext Starter Kit with AXC F 2152 (article no.: 1046568 or 1188165)
- SD Flash 2GB or 8GB PLCnext Memory (1043501 or 1061701)

### Software

The following software must be installed on the PC:
- WinSCP
- PuTTY
- HTML5 capable browser
- PLCnext Engineer version 2021.9 or later
- PLCnext Control firmware version 2021.0.5 LTS or later

### Installation preparation

Please prepare your PLCnext Control as follows:
1. Reset your PLC. For this, push the reset button for 3 seconds during the boot process.
2. Open PLCnext Engineer and create a new project via "File" > "New Project".
3. Double-click on "Project" on the left side and then open the "Online Controllers" tab. Here you can scan the network, integrate the available PLC into your project and set the IP and gateway address to connect to the Internet.
4. When connecting to the Internet, also make sure that the system time of the PLC is configured correctly for your router. This might be UTC or your local time. To do this, select "PLCnext" in the project tree and navigate to "Online parameters" > "Real-time clock". In the fields you can define date and time. Via the buttons in the menu of this window you can write and read the PLC time.
5. Now create a WinSCP session, then start PuTTY and login as 'admin'.
6. Create a 'root' user via : <code> sudo passwd root </code>
7. Change to the 'root' user via: <code> su </code> . You will then have to enter the root password you just set.
8. To clean the SD cart from any existing Docker containers, run: <code> rm -r /media/rfs/rw/var/lib/balena </code>
9. Download the [balenaEngine app](https://www.plcnextstore.com/eu/app/963) container provided in the PLCnext Store to your computer.
10. To open the Web-based Management enter the following URL in web browser: https://<ip.of.your.plc>/wbm
11. Install the balenaEngine app by using the Web-based Management option "PLCnext Apps" > "Install App"
12. Start the app after installation.
13. Switch back to WinSCP and transfer "setup.sh" to /opt/plcnext .
14. Make the shell script executable. Therefor enter: <code> chmod +x setup.sh </code> in PuTTY.
15. Run the installation script: <code> ./setup.sh </code> . Because some software has to be downloaded from the Internet, the installation may take some time (approx. 30min). You might see some warnings, but these can be ignored. However, you should finally see that all software could be installed.
16. Open your browser and enter the URL: http://<ip.of.your.plc>:1880. Node-RED should now be opened. 
17. Here you can import the prepared flow. To do this, click on the menu button at the top right and select "Import". The "flows.json" available in this repository should now be specified here. After the import, the flow is available in a new worksheet. The first, empty worksheet can be deleted (by double-clicking on the tab and then "Delete").
18. Open the PLCnext Engineer demo project. 
- If you're working with the Starter Kit with the article no. 1046568, please use: CoffeeMachine_oSK.pcweax
- If you have the Starter Kit with the article no. 1188165, please open: CoffeeMachine_nSK.pcweax

19. Here change the IP address of your PLC back to 192.168.1.10.
20. Then download the demo project to the AXC F 2152.
21. For security reasons, disconnect your PLC from the Internet. Then open the Web-based Management to deactivate the User Authentication.
22. Then restart the PLC.
23. Finally, connect to the HMI via web browser. The URL is: https://192.168.1.10. You should now be able to see the start page.


## Project content

Here some more information about this demo project:

### Start page

![Alt-Text](images/startpage.PNG)

In the upper left area you can switch the language to English as needed.
All elements will then be translated. 

Below that, you have 12 tiles on different topics to choose from. By clicking on a tile you will get more information about the respective topic and you can experience the functionality on PLCnext Control by means of the demo application of a coffee machine. 

<b> Please note: </b> This is only a selection of some possibilities that can be used with PLCnext Control.
  
### Project

Via the first tile you get a short overview of the demo project of a coffee machine.  
  
The round info buttons allow you to call up additional information.

![Alt-Text](images/coffee_machine.PNG)
 
You can also operate the coffee machine here and make virtual coffee. 

For this, select directly in the visualization whether you want to fill a cup or a mug. You can use the slider on the PLCnext Starter Kit to define the intensity of the coffee.
Your setting is displayed in the visualization within the control panel. 

Finally, you can start the process using the first button on the Starter Kit board.
The panel shows the status of the coffee machine. After completion, the coffee machine returns to its initial state and you can order another coffee.

### Web-based Management

This tile brings you directly to the Web-based Management, which offers a wide variety of configurations and provides diagnostic information.

### PLCnext Community

Here you can see a screenshot of the PLCnext Community page as well as blocks with keywords for content that can be found within the PLCnext Community.
  
If your PC has an Internet connection, you can also open the PLCnext Community directly via the button "www.plcnext-communtity.net".

![Alt-Text](images/plcnext_community_2.PNG)

### PLCnext Store

Via this tile you can get a first overview of the PLCnext Store by means of the image and key points.  
  
In addition, it is possible to see which apps are installed on the PLC. This is possible by clicking on "Apps on this PLC". By default, this demo project only uses of the belanaEngine app.
  
If your computer has an Internet connection, then you can also open the PLCnext Store by clicking on "www.plcnextstore.com". 

![Alt-Text](images/plcnext_store.PNG)

### IEC 61131

One part of the demo project was realized in the programming languages of IEC 61131 standard. 

- To first get an overview of the software used for this, you will find general information about the engineering software in the preselected area "PLCnext Engineer".
- Via the button "IEC 61131 Editors" a general overview of the available editors in PLCnext Engineer is given. 
- Finally, you can also try out IEC 61131 programming in a demonstration. It is used to control the fill level depending on the cup size and to determine the machine status. Via "Panel" you can open the operating panel of the coffee machine and change the preselection from "Mug" to "Cup". Then close the panel window and press the start button on the Starter Kit (first button). In the green fields you can now see the status of the coffee machine and how much coffee has been output.

![Alt-Text](images/iec61131.PNG)

### C++

The control of the grinder depending on the selected coffee strength has been programmed in C++. 

In the screenshot you can see that Eclipse was used for this. However, the PLCnCLI tool provided by Phoenix Contact allows programming in any C++ editor or even in a simple text editor. 

The use of Eclipse or Visual Studio offers the advantage that plug-ins are provided free of charge for these softwares, which allow an interface-based operation, i.e. menu options for PLCnext. 

When compiling the project, a PLCnext Engineer library is created, which contains the C++ program(s). This library can then be transferred to the PLCnext Engineer project. Finally, the C++ program must be instantiated and any ports provided can be linked, for example to enable process data access.

Some examples of C++ projects for PLCnext Control can be found on GitHub. If you click on the Block with the GitHub icon you can directly open the C++ examples provided there. 

![Alt-Text](images/cpp.PNG)

In the "C++ Demo" area you can test the programming related to the coffee machine project.  
To do this, simply start the machine via the start switch on the PLCnext Starter Kit (first switch). In the green fields you can read information about the grinding process. Depending on how you set the intensity via the slider, the grinding process will take longer or less time.

### Matlab Simulink

Matlab Simulink models can be compiled to PLCnext Engineer libraries using the "PLCnext Target for Simulink". This was done here for the simulation of the filling process.

![Alt-Text](images/simulink_integration.PNG)

There are two further sections here. In "Debugging in Matlab Simulink" it is shown how the online values can be examined directly in Matlab Simulink via External Mode. 
For this purpose, a "Scope" block has been added, which can be used to observe the temporal course of the coffee volume.

![Alt-Text](images/simulink_external_mode.PNG)

How debugging works without Matlab Simulink license is shown in the section "Debugging in PLCnext Engineer". Here, thanks to the PLCnext Engineer add-in, the Simulink model is displayed directly in the engineering project with online values. Ports can also be observed over time via the logic analysis.

![Alt-Text](images/simulink_PLCnEng_debugging.PNG)

### Python

In the section "Python Integration" you can find some general information and keywords about the usage of Python on PLCnext Control. 

![Alt-Text](images/python.PNG)

In the demo project a Python script is started automatically via "crontab" when booting the controller. It is used to provide the database of the data logger via HTTP. This can be initiated via the button "Data logger directory".

<b> Attention: </b> Since the script is started at boot time, always when the PLCnext Engineer project has been sent to the controller, the PLC must be restarted. This is the only way to execute the script again. Therefore it is best to avoid sending projects and if possible just try to connect to the PLC to change into debug mode.

The Python code can be downloaded and opened in any text editor. If you are interested, use the "Python Script" button for downloading.

### Docker

Here you will first get general information about using Docker on PLCnext Control.

An example is given to you in relation to Node-RED, which was installed on the PLC as a Docker container.

![Alt-Text](images/docker.PNG)

You can view a Node-RED sample application by clicking on the button "Node-RED". Node-RED is used in the project to receive OPC UA events (alarms). A part of the shown Node-RED flow realizes an OPC UA client. 
The received alarm messages are listed in the dashboard in tabular form. 
To try this out, it is a good idea to first open the Node-RED Flow to see if the client is connected. You should see a green icon under the "OPC UA Client" node together with the text "keepalive" - as shown in the screenshot in the visualization. 
Then open the dashboard view via "Alarms in Dashboard". The table will be empty at this point. 

Next, click on "Create alarm" to open the dialog for blocking the grinder. Select "Block grinder" to create the alarm. It should now be displayed in the dashboard. The same button in the HMI can be used to repair the grinder. This means that the alarm is no longer active, but it has not yet been confirmed. To do this, select "Alarm Reset".

![Alt-Text](images/opc_ua_alarm.PNG)

After that, you should see two further messages in the dashboard: One that informs that the alarm is inactive but not confirmed, and another, which finally indicates the confirmation. 

If you want to send the alarm messages by mail, your PLC needs a connection to the Internet. When connecting to the Internet, ensure that security measures are taken to prevent unauthorized access. Additionally, the email node in Node-RED must be configured. At this point a mail server has to be defined.  More information can be found here: https://flows.nodered.org/node/node-red-contrib-email-out. For the recipient you can use the "Recipient" input field within the Node-RED dashboard. Whenever a new alarm message is created, you should receive a mail. However, depending on your Internet connection and mailbox configuration, this may take a few seconds or minutes. If necessary, also have a look in your spam folder. 

### Data logging

This section first gives some general information about logging data. You will find a selection of possibilities that are available to you with the PLCnext Control. So data can be logged internally, i.e. directly on the controller, or in external databases.

![Alt-Text](images/data_logging.PNG)

The "Real-time data logger" area allows you to view data logged in an SQLite database. For this, the data logger can be configured within the PLCnext Engineer project. An additional programming is not necessary. 
The SQLite database is then created and filled directly on the PLC. You can download the database from the PLC and open it, for example, using the "DB Browser for SQLite" software.

![Alt-Text](images/real-time_data_logging.PNG)

### OPC UA

On the subject of OPC UA, it is first shown which server configurations are possible. The picture on the left side is partly interactive. Thus you can display the different setting areas by clicking on the different menu options - just as it is possible in the PLCnext Engineer software. For a better overview, the selected area is additionally framed in red here.

![Alt-Text](images/opc_ua_server_conf.PNG)

In "OPC UA Alarms" you have the possibility to cause an alarm by blocking the grinder via mouse click. To do this, select the button "Block Grinder". You will then see that the alarm status changes to "true" and the coffee machine changes to the "Error" status.

![Alt-Text](images/opc_ua_active_alarm.PNG)

Also with a mouse click, you can repair the grinder again. This causes the alarm status to be set to "false". However, since no error confirmation has yet taken place, the coffee machine will remain in the "Error" state until "Reset alarm" is selected.

The occurrence of an alarm, when it is no longer active ot when it is confirmed can also be seen within the Web-based Management. This can be explored via the "Alarm in WBM" button.

In addition, a Node-RED flow, that is an OPC UA client, receives the alarm messages and outputs them in a dashboard. You can access this client dashboard via "Alarms on client side".
For more information, see the [Docker] chapter

<b> Attention: </b> The table in the dashboard lists only alarm messages received after opening the dashboard. 

Furthermore, it is possible to access historical data, if a variable is provided via OPC UA as well as processed by the data logger. 
If a client supports OPC UA Historical Access (HA), then it could make use of this function. The client shown here is the test client of Unified Automation "UA Expert".

![Alt-Text](images/opc_ua_historical_access.PNG)

### Cloud access

PLCnext Control can be connected to different cloud solutions, e.g. via MQTT. Some of these possibilities can be found here in the "Clouds" section.

![Alt-Text](images/clouds_2.PNG)

One cloud solution that can be accessed directly thanks to an integrated cloud coupler and without additional programming is Proficloud.io from Phoenix Contact.
More information to Proficloud.io will be available by clicking the corresponding button. 

![Alt-Text](images/proficloud_io.PNG)

Here you can see some general information and which services are available for PLCnext Control.
If you click on the "Time Series Data Service" button, you will see a screenshot of a dashboard that displays the available amount of coffee beans. If a minimum level is reached, an alarm can be generated automatically, which informs you by mail that coffee beans should be refilled.

![Alt-Text](images/proficloud_io_tsd_2.PNG)

You can also try this yourself. For this purpose, your PLC requires a connection to the Internet. Make sure that security measures are taken to prevent unauthorized access to your PLC. To connect the AXC F 2152 to proficloud.io, the service must be enabled via Web-based Management. Furthermore, the PLC must be registered within the proficloud.io which can be done via UUID shown in the Web-based Management (but also printed on the PLC housing). Once the PLC is registered you can search for provided data. You will find here the amount of coffee beans which can be visualized in a dashboard.

## License

Copyright (c) Phoenix Contact GmbH & Co KG. All rights reserved.

Licensed under the [MIT](LICENSE) License.
