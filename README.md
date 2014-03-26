# CURRENTLY BROKEN - WILL TRY TO FIX LATER.  Sorry folks!

# LAMP Stacks Made Easy with Vagrant & Puppet

Building a LAMP stack with Puppet and Vagrant to develop, test, and/or build the worlds next great application should be easy. Use this all inclusive code to quickly kickstart your next application environement.

## Shout outs!
Credit must be given where credit is due. Most of this work was made possible by:
* [PerishableDave/puppet-lamp-stack](https://github.com/PerishableDave/puppet-lamp-stack).
* [jas0nkim/my-vagrant-puppet-lamp](https://github.com/jas0nkim/my-vagrant-puppet-lamp).
* [jrodriguezjr/puppet-lamp-stack](https://github.com/jrodriguezjr/puppet-lamp-stack).
* [Parallels/vagrant-parallels](https://github.com/Parallels/vagrant-parallels).

## Prerequisites
* [Vagrant](http://www.vagrantup.com/)
* [Virtual Box](https://www.virtualbox.org/)
OR
* [Parallels] (http://www.parallels.com/)

## Instructions
0. Insure Vagrant and Virutal Box or Parallels are installed.
1. I use the ricordanza/wheezy box (from vagrantcloud.com with Vagrant 1.5.x)
    
        $ vagrant init ricordanza/wheezy
        
1. Install precise32 Vagrant box. (If not installed already)

        $ vagrant box add precise32 http://files.vagrantup.com/precise32.box

2. Clone this repository into your working folder.

        $ git clone https://github.com/shabbirh/puppet-lamp-stack.git .
        
3. Create directory "webroot" in the root directory of the clone. This will act as your root web folder.
4. Open up terminal, change directory to the git repo root, and start the vagrant box.

        $ vagrant up

5. Upgrade Parallels Tools.  Follow these instructions:
    5.1. Start the virtual machine.
    5.2. When the VM has booted, select the "Virtual Machine/Reinstall Parallels Tools" option from the Parallels Menu.
    5.3. Get root priviledges on your VM - either use su - or sudo -i
    
        $ sudo -i
    
    5.4. Check if the Parallels Tools ISO is already mounted:
    
        # mount | grep iso9660
    
    5.5. If the above command returns anything that has the words "noexec" in it - then follow the instructions below, otherwise skip over to 5.7.:
        5.5.1. Unmount the ISO
    
            # umount /dev/cdrom
    
    5.6. Mount the ISO with exec permissions:
       
        # mount -o exec /dev/cdrom /media/cdrom
    
    5.7. Install the Tools
      
        # cd /media/cdrom
        # ./install
        
    5.8. Follow the on-screen instructions.
    
    5.9. Restart the Vagrant Machine
    
        $ vagrant halt
        # vagrant up
   
   (For more detailed instructions on Upgrading Parallels Tools see: http://download.parallels.com/desktop/v4/docs/en/Parallels_Desktop_Users_Guide/22570.htm)        

You're all set up. The webserver will now be accessible from http://localhost:8888

## System Package include

* apache2 - rewrite mode enabled, having virtual host with config - refer manifest/vagrant_webroot.sample
* php5
* php5-cli
* php5-mysql
* php-pear - installed packages: phpunit and its dependencies
* php5-dev
* php5-gd
* php5-mcrypt
* libapache2-mod-php5
* mysql-server
* curl
* vim
* htop
