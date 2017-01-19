C:\Windows\System32\inetsrv\appcmd.exe add site /name:website /physicalPath:C:\website /bindings:http/*:80:
C:\Windows\System32\inetsrv\appcmd.exe set site "website" /virtualDirectoryDefaults.userName:vagrant /virtualDirectoryDefaults.password:vagrant
