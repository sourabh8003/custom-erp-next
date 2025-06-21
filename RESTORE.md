BACKUP RESTORE:

//Copy your backup file to frappe-bench folder:
LS -- To show files in folder:

//REPLACE SITE1.LOCAL WITH YOUR SITE NAME:
//REPLACE DATABASE_FILE NAME WITH YOUR DATABASE BACKUP FILE.

bench --site site1.local --force restore [database_file] --with-private-files [private_file] --with-public-files [public_file]


//bench --site site1.local --force restore 20230918_102707-site1_local-database-enc.sql.gz --with-private-files 20230918_102707-site1_local-private-files-enc.tar --with-public-files 20230918_102707-site1_local-files-enc.tar

bench --site site1.local 
--force restore 20230918_102707-site1_local-database-enc.sql.gz 
--with-private-files 20230918_102707-site1_local-private-files-enc.tar 
--with-public-files 20230918_102707-site1_local-files-enc.tar

----------------------------------------------------------------------------------
APPs INSTALL ON BACKUP..
1-ERPNEXT
2-FRAPPE
3-HRMS
4-CHAT
-------------
APPS INTALL ON YOUR LOCAL SITE....???
CHECK YOUR INSTALLATION BY "bench version"
-----------------------------------------

    
REMOVE APP:
bench --site site1.local uninstall-app chat
bench --site site1.local uninstall-app app_name

//REMOVE OTHER APP THAT YOU HAVE EXTRA INSTALL.

REMOVE APP FROM YOUR BACKUP:
bench --site site1.local remove-from-installed-apps erpnext_support
bench --site site1.local remove-from-installed-apps journeys

------------------------------------------------------------------------------------

INSTALL HRM:
bench get-app hrms --branch version-14
bench --site sitename install-app hrms

INSTALL CHAT:
bench get-app chat
bench --site site1.local install-app chat

//INSTALL APP THAT YOU DO NOT HAVE ON YOUR SITE BUT HAVE IN BACKUP.

-------------------------------------------------------------------------------------
//Finally Bench Migrate
bench migrate

=====================​