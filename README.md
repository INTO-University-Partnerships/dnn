# Vagrant .NET

* A Vagrant environment which provisions IIS, .NET, SQL Server on a Windows guest (and allows DNN 7.4.2 to be installed)
* Based on [this repo](https://github.com/kwilson/vagrant-octopus)
* Vagrant 1.9.1 (or possibly later) is required

## Vagrant remote desktop

Managing a Windows guest purely on the command line is ... a challenge.
Use remote desktop instead.

    apt install rdesktop
    vagrant rdp -- -g 70%

## Vagrant Unison

Unison is used to synchronize files (two-way) in the `website/` directory between host and guest.

* [Vagrant Unison2 plugin](https://github.com/dcosson/vagrant-unison2)
* Install with `vagrant plugin install vagrant-unison2`
* On an Ubuntu Xenial host, `apt install unison` will install Unison 2.48.3 (compiled with OCaml 4.02)
* On the Windows guest, Unison 2.48.3 (compiled with OCaml 4.02) is provisioned automatically

## IIS

* On the Windows guest, in "Application Pools" -> "DefaultAppPool" -> "Advanced Settings" -> "Process Model" -> "Identity", set the identity to the `vagrant` account

## DNN

The Vagrant environment provisions IIS, .NET, SQL Server, but not DNN iself.

To [install DNN](http://www.dnnsoftware.com/wiki/how-to-install-dotnetnuke) 7.4.2 ...

* The requirements for DNN 7.4.2 are [here](http://www.dnnsoftware.com/platform/start/install#2047)
* Extract `DNN_Platform_07.04.02_Install.zip` into `website/`
* In the host, run `vagrant up`
* In the Windows guest, stop IIS
* In the Windows guest, create a new/blank SQL Server database (called e.g. `dnn`)
* Run `vagrant unison-sync-once` to sync the DNN files to (and from!) the Windows guest
* In the Windows guest, start IIS
* Visit `http://10.0.0.10` in a browser
* Change the DNN database install settings to connect to the previously created new/blank database with the credentials in `scripts/install-sql-server.cmd`, i.e. `sa` and `#SAPassword!`
* See `DNN_database_install_settings.png` for a screenshot of DNN database install settings
