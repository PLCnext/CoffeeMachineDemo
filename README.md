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
- SD Flash with 8GB PLCnext Memory (1061701)

### Software

The following software must be installed on the PC:
- WinSCP
- HTML5 capable browser
- PLCnext Engineer version 2024.0.2 LTS or later
- PLCnext Control firmware version 2024.0 LTS or later

### Installation preparation

Please prepare your PLCnext Control as follows:

**First steps:**
1. Reset your PLC. For this, push the reset button for 3 seconds during the boot process.
2. Download the PLCnext Engineer demo project from this repository. You can open it with PLCnext Engineer 2024.0.2 LTS.
    - If you're working with the Starter Kit with the article no. 1046568, please use: CoffeeMachine_oSK.pcweax
    - If you have the Starter Kit with the article no. 1188165, please open: CoffeeMachine_nSK.pcweax
3. Write/send the demo project to the AXC F 2152.

**For Node-RED:**
1. Download the Node-RED app for the coffee machine demo from the PLCnext Store: https://www.plcnextstore.com/eu/app/1097 . This app already contains all the libraries required for the project.
2. Now open the Web-based Management (WBM). For this, enter the following URL in web browser: https://192.168.1.10/wbm
3. Install the Node-RED app in the WBM section "PLCnext Apps" > "Install app".
4. Start the app after installation. *Please note:* The start process takes around 15-20 minutes. If you can access the WBM page again, the software is almost ready -> see next step.
5. Restart your PLC, e.g. by switching off and switching on the power supply.
6. After reboot, wait a few seconds. After a short waiting time Node-RED can be access within a web browser using the URL: http://192.168.1.10:61880
7. Use the "flow.json" file from this repository and import it to Node-RED. To do this, click on the menu button at the top right and select "Import". The flow is available in a new worksheet. The first, empty worksheet can be deleted (by double-clicking on the tab and then "Delete").
8. In the OPC UA client node you will find the configuration for the communication with the server. Open this server configuration, activate the "Use authentication" option and enter username and password of your PLCnext Control. Then save your changes.
9. Deploy your Node-RED flow.

**For Python:**
1. Now you can prepare the Python application. For this, download the app from here: https://www.plcnextstore.com/eu/app/1096
2. Install and start the Python app via WBM. *Please note:* The start process takes around 20 minutes.
3. Create a WinSCP session and change to: /opt/plcnext/appshome/data/60002172000864/src.
4. Open the Python script "MyScript.py" on your PLCnext Control and copy the Python code from the file provided here to the file on your PLC.
5. Go to line 16 and enter the password of your PLCnext Control, where "password" is written. Then save all changes.

**Last steps:**
1. Reboot the PLC. 
2. After this, the project installation is finished and you can access and use the visualization in the web browser: https://192.168.1.10.

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

![Alt-Text](images/plcnext_community_3.PNG)

### PLCnext Store

Via this tile you can get a first overview of the PLCnext Store by means of the image and key points.  
  
In addition, it is possible to see which apps are installed on the PLC. This is possible by clicking on "Apps on this PLC". By default, this demo project only uses of the belanaEngine app.
  
If your computer has an Internet connection, then you can also open the PLCnext Store by clicking on "www.plcnextstore.com". 

![Alt-Text](images/plcnext_store_2.PNG)

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

![Alt-Text](images/python_2.PNG)

In the demo project a the Python code is running within a Docker container that has been installed via app. It is used to provide the database of the data logger via HTTP. To do this, a C++ component (not in real time) copies the data logger file to the container volume every 10 seconds. In addition, a conversion to CSV is done in C++. This CSV file is also copied to the container volume. It enables the container to access these files, as a Docker container has no other way of reaching the host operating system. The Python script checks the status of the "Data logger directory" button. If this changes to TRUE, an HTTP socket is created and the data logger files (SQLite and CSV) become accessible via the browser.

The Python code can be downloaded and opened in any text editor. If you are interested, use the "Python Script" button for downloading.

### Docker

Here you will first get general information about using Docker on PLCnext Control.

An example is given to you in relation to Node-RED, which was installed on the PLC as a container-based app.

![Alt-Text](images/docker.PNG)

You can see a Node-RED sample application by clicking on the button "Node-RED". Node-RED is used in the project to receive OPC UA events (alarms). A part of the shown Node-RED flow realizes an OPC UA client. 
The received alarm messages are listed in the dashboard in tabular form. 
To try this out, it is a good idea to first open the Node-RED Flow to see if the client is connected. You should see a green icon under the "OPC UA Client" node together with the text "keepalive" - as shown in the screenshot in the visualization. 
Then open the dashboard view via "Alarms in Dashboard". The table will be empty at this point. 

Next, click on "Create alarm" to open the dialog for blocking the grinder. Select "Block grinder" to create the alarm. It should now be displayed in the dashboard. The same button in the HMI can be used to repair the grinder. This means that the alarm is no longer active, but it has not yet been confirmed. To do this, select "Alarm Reset".

![Alt-Text](images/opc_ua_alarm.PNG)

After that, you should see two further messages in the dashboard: One informs that the alarm is inactive but not confirmed, and another, which finally indicates the confirmation. 

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
