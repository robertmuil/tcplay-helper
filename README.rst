# tcplay-helper
tcplay-helper lets you easily manage tc-play containers. The script currently supports mounting and unmounting tc-play containers and will hopefully support creating containers in the near future. Usage is simple and the only requirement is that tcplay is installed on the system.


Note
====
tcplay-helper is still crude and early in development. Its been tested primarily with containers formatted as ext4. 

Usage
=====
.. code-block::
    $ tcplay-helper open/close <container-file> <username>


The script takes three arguments.

* "Open" or "Close" depending on whether you want to mount or unmount the container
* The container file name
* The username you want to mount the container as. 

Oh, and the script needs to be run as root

Installation
=====

Just download the tcplay-helper script and place it wherever you want. For easy installation, tcplay-helper can be installed through the AUR.
