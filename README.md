# Vagrant .NET

A Vagrant environment which provisions .NET on Windows based on [this repo](https://github.com/kwilson/vagrant-octopus)

## appcmd

In `C:\Windows\System32\inetsrv` ...

    .\appcmd.exe list site
    .\appcmd.exe list site "website" /config
    .\appcmd.exe start site "website"
    .\appcmd.exe stop site "website"

## sshfs

[Fedora magazine](https://fedoramagazine.org/vagrant-sharing-folders-vagrant-sshfs/)
[SSHFS on Windows](https://igikorn.com/sshfs-windows-10/)

    vagrant plugin install vagrant-sshfs
