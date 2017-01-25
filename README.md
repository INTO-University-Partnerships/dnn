# Vagrant .NET

* Based on [this repo](https://github.com/kwilson/vagrant-octopus)
* A Vagrant environment which provisions .NET on a Windows guest and allows DNN 7.4.2 to be installed
* Vagrant 1.9.1 (or possibly later) is required
* The requirements for DNN 7.4.2 are [here](http://www.dnnsoftware.com/platform/start/install#2047)

## Vagrant Remote desktop

Managing a Windows guest purely on the command line is ... a challenge.
Use remote desktop instead.

    apt install rdesktop
    vagrant rdp -- -g 70%

## Cygwin and rsync

* Cygwin needs to be installed on the Windows guest (in particular `rsync`) using `setup-x86_64.exe`
* Cygwin's `bin/` directory needs to be prepended to the Windows path (so Vagrant can actually find `rsync`)
* After Cygwin is installed, enable the rsync shared folder in `Vagrantfile` (i.e. set `disabled: false`) then `vagrant reload`
* Use `vagrant rsync-auto` to sync automatically
* Permissions are tricky to get right using `rsync` but [this helped](http://docs.drupalvm.com/en/latest/extras/syncing-folders/#options)

## IIS appcmd

In `C:\Windows\System32\inetsrv` ...

    .\appcmd.exe list site
    .\appcmd.exe list site "website" /config
    .\appcmd.exe start site "website"
    .\appcmd.exe stop site "website"
    .\appcmd.exe set site "website" /virtualDirectoryDefaults.userName:vagrant /virtualDirectoryDefaults.password:vagrant

## DNN

To [install DNN](http://www.dnnsoftware.com/wiki/how-to-install-dotnetnuke) 7.4.2 ...

* Extract `DNN_Platform_07.04.02_Install.zip` into `website/`
* Run `vagrant up`
* Stop IIS
* Run `vagrant rsync` or `vagrant rsync-auto` to sync the DNN files to the Windows guest
* Start IIS
* Create a new/blank database (called e.g. `dnn`)
* Visit `http://10.0.0.10` in a browser
* Change the database install options to connect to the previously created new/blank database with the credentials in `scripts/install-sql-server.cmd`, i.e. `sa` and `#SAPassword!`
