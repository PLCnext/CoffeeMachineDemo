# ***************************************************************************************************************************************************
# This Python script is used to provide the datalogger files
# in case of a request via visualization
# ***************************************************************************************************************************************************

# Libraries
from PyPlcnextRsc import Device, RscVariant, RscType
from PyPlcnextRsc.Arp.Plc.Gds.Services import IDataAccessService, WriteItem
import http.server
import socketserver
import os
import datetime
import time

# RSC connection
secureInfoSupplier = lambda:("admin","password") # <- change password here
device = Device("192.168.1.10", secureInfoSupplier=secureInfoSupplier)
device.connect()

data_access_service = IDataAccessService(device)

# Defintions
problem_counter = 0
datalogger_dir = os.path.join(os.path.dirname(__file__), '/data/log')

while problem_counter <= 2 :
    try:
        # read trigger variable
        read_item = data_access_service.ReadSingle("Arp.Plc.Eclr/INST_LevelControl1.xDataBaseReqPython")
        value = read_item.Value.GetValue()

        # Provide datalogger directory if request value is true
        if value:
            os.chdir(datalogger_dir)
            Handler = http.server.SimpleHTTPRequestHandler
            httpd = socketserver.TCPServer(("", 80), Handler)
            httpd.serve_forever()
               
    except:
        with open("/data/DatabaseRequest_Test.log", "a") as f:
            f.write("%s - Database request not successful \n" %datetime.datetime.now())
        problem_counter = problem_counter + 1
