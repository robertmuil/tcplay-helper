tcplay-helper
================
tcplay-helper lets you easily manage tc-play containers. The script currently supports mounting and unmounting tc-play containers and will hopefully support creating containers in the near future. Usage is simple and the only requirement is that tcplay is installed on the system.


Note
====
tcplay-helper is still crude and early in development. Its been tested primarily with containers formatted as ext4. 

Usage
=====

.. code-block::

   $ tcplay-helper open/close <container-file> <username>

The script takes three arguments.

* "open" or "close" depending on whether you want to mount or unmount the container
* The container file name
* Optional: The username you want to mount the container as. This can be omitted to mount the container as root, and is not necessary when closing the container.

So for example, if I have a contained named container.tc and wanted to open it as the user archie I would run execute the following.

.. code-block::

   $ tcplay-helper open container.tc archie
   
And when I'm done playing around and I want to close the container, I simply run:

.. code-block::

   $ tcplay-helper close container.tc

Oh, and the script needs to be run as root

Installation
=====

Just download the tcplay-helper script and place it wherever you want. For easy installation, tcplay-helper can be installed through the AUR.
