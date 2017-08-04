# Create a cluster of Virtual Machines with disks prepared for Vertica

[![Deploy to Azure](http://azuredeploy.net/deploybutton.png)](https://azuredeploy.net/)

You need to pass the following parameters to the script  
  
vmsize: The VM Size to provision this should be either DS15_V2, or GS3 (Use capitalization as shown)
  
adminuser: The name of the user used to connect remotely  
  
VNET: The Name of the VNET to provision into  
  
FrontEndNicSubnet: The name of the primary nic subnet  
  
BackEndNicSubnet: The name of the secondary nic subnet  
  
NodeCount: The number of nodes to provision  
  
DiskCount: The number of data disks to provision  
  
DiskSize: The size in GB of the data disks  
  
adminPassword: the adminPassword to provision  