$ErrorActionPreference = "Stop"
import-module webadministration
Stop-WebSite 'Default Web Site'
Remove-Website 'Default Web Site'
