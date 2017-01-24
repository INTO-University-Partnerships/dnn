# Vagrant .NET

* Based on [this repo](https://github.com/kwilson/vagrant-octopus)
* A Vagrant environment which provisions .NET on a Windows guest
* Vagrant 1.9.1 (or possibly later) is required

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
