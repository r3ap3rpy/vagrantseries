# Welcome to the centos box.

This box contains the following:
 - centos/7 image
 - Python 3.7.0 built from source
 - The default python and pip commands relinked.

You can specify a new user in the Vagrantfile as argument to the ***add_user.sh*** and replacing the password with the output of command ***mkpasswd -m sha-512*** in the shell script.

The default custom user is ***r3ap3rpy*** with password ***Start!123***