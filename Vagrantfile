# -*- mode: ruby -*-
# vi: set ft=ruby :

if ! File.exists?('./NDP452-KB2901907-x86-x64-AllOS-ENU.exe')
    puts '.Net 4.5.2 installer could not be found!'
    puts "Please run:\n wget http://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe"
    exit 1
end

if ! File.exists?('./SQLEXPRWT_x64_ENU.exe')
    puts 'SQL Server installer could not be found!'
    puts "Please run:\n wget http://download.microsoft.com/download/0/4/B/04BE03CD-EAF3-4797-9D8D-2E08E316C998/SQLEXPRWT_x64_ENU.exe"
    exit 1
end

Vagrant.configure(2) do |config|
    config.vm.define ".NET" do |foo|
    end

    config.vm.provider "virtualbox" do |vb|
        vb.memory = 2048
        vb.cpus = 2
    end

    config.vm.box = "ferventcoder/win2008r2-x64-nocm"
    config.vm.guest = :windows
    config.vm.communicator = "winrm"

    config.vm.provision :shell, inline: "rm c:\\tmp\\*"
    config.vm.provision :shell, path: "scripts/install-iis.cmd", upload_path: "c:\\tmp\\install-iis.cmd"
    config.vm.provision :shell, path: "scripts/delete-default-iis-website.ps1", upload_path: "c:\\tmp\\delete-default-iis-website.ps1"
    config.vm.provision :shell, path: "scripts/install-dot-net.ps1", upload_path: "c:\\tmp\\install-dot-net.ps1"
    config.vm.provision :shell, path: "scripts/install-dot-net-45.cmd", upload_path: "c:\\tmp\\install-dot-net-45.cmd"
    config.vm.provision :shell, path: "scripts/install-sql-server.cmd", upload_path: "c:\\tmp\\install-sql-server.cmd"
    config.vm.provision :shell, path: "scripts/restart-sql-server.ps1", upload_path: "c:\\tmp\\restart-sql-server.ps1"
    config.vm.provision :shell, path: "scripts/install-website.cmd", upload_path: "c:\\tmp\\install-website.cmd"

    config.vm.boot_timeout = 600

    config.vm.network "private_network", ip: "10.0.0.10"
    config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true
    config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true

    config.vm.synced_folder "website", "c:\\website",
        disabled: true,
        type: "rsync",
        rsync__exclude: [".git/"],
        rsync__chown: false,
        rsync__verbose: true,
        rsync__args: ["--verbose", "--archive", "--delete", "-z", "--copy-links", "--chmod=gu=rwX,o=rX"]
end
