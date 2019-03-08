# REHL7 WordPress Installer

Setup installer## Installation for a new REHL 7 server to setup required technologies and install WordPress.

Installer adds the following to the server:
* Apache
* MySQL community
* wget, nano & pwgen packages
* Fresh install of WordPress to /var/www/html

## Installation

Upload install.bash to your server or run, if spinning up an EC2 instance add install.bash to the Configure Instance > Advanced Details > User Data area to have it auto run the installer on initialisation.

Once logging in for the first time follow the motd instructions.

## Credits

Chris Morris [https://github.com/codecomp]
