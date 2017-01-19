# Vagrant .NET

A Vagrant environment which provisions .NET on Windows based on [this repo](https://github.com/kwilson/vagrant-octopus)

## appcmd

In `C:\Windows\System32\inetsrv` ...

    .\appcmd.exe list site
    .\appcmd.exe list site "website" /config
    .\appcmd.exe start site "website"
    .\appcmd.exe stop site "website"
