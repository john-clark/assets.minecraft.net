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

Open your webbrowser to:
http://yourserver/minecraftdownloads

Troubleshooting
---------------
Edit index.php and comment out the http...xml line and
uncomment the included assets.minecraft.xml line.

* Note: Tested on debian wheezy
