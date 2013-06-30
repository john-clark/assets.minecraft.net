assets.minecraft.net
====================
make a local mirror of assets.minecraft.net 
using bash with a php xsl transformation webpage

REQUIREMENTS
------------
Make sure you have php with xml styling installed 
(apt-get install php5-xsl)

Installation
------------
* git https://github.com/john-clark/assets.minecraft.net.git
* run createmirror.sh
* Open your webbrowser to: http://yourserver/minecraftdownload/mirror.phps

Troubleshooting
---------------
both createmirrorsh.sh and index.php can be used with the 
included assets.minecraft.xml to test functionality offline
Edit index.php and comment out the http line 
and uncomment the line that points to the local xml file

* Note: Tested on debian wheezy
