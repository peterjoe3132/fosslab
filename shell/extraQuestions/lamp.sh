
#!/bin/bash

    	#Apache Installation
   	sudo apt-get update
  	sudo apt-get install apache2

	#MySQL Installation
   	sudo apt-get install mysql-server
   	mysql_secure_installation
   	mysql -u root -p

	#PHP Installation
    	sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql
	sudo nano /etc/apache2/mods-enabled/dir.conf
	sudo systemctl restart apache2
	sudo systemctl status apache2

