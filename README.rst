tcplay-helper
================
tcplay-helper lets you easily manage tc-play containers. The script currently supports mounting and unmounting tc-play containers and will hopefully support creating containers in the near future. Usage is simple and the only requirement is that tcplay is installed on the system.


Note
====
tcplay-helper is still crude and early in development. Its been tested primarily with containers formatted as ext4. 

Usage
=====

.. code-block::

   $ tcplay-helper create/open/close <container-file> <OPTION>


* "create," "open" or "close" depending on whether you want to create a new container or mount/unmount an existing container
* The container file name
* The OPTION depends on what operation you are performing.
 * create [container] [SIZE]
 * open [container] [OPTIONAL: user to mount as]
 * close [container]

So for example, if I wanted to create a new 1M sized container named container.tc I would do as follows.

.. code-block::
   
   $ tcplay-helper create container.tc 1M

Then if I wanted to open it as the user archie I would run execute the following.

.. code-block::

   $ tcplay-helper open container.tc archie

Alternatively, if I just wanted to open and mount the container as root I can exclude the username argument

.. code-block::
   $ tcplay-helper open container.tc

   
And when I'm done playing around and I want to close the container, I simply run:

.. code-block::

   $ tcplay-helper close container.tc

Oh, and the script needs to be run as root. Don't worry though, the script will remind you if you run it as a regular user.

Installation
=====

Just download the tcplay-helper script and place it wherever you want. For easy installation, tcplay-helper can be installed through the AUR.
