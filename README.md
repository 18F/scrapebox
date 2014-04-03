Scrapebox
============================
A simple, system independent infrastructure for performing web scraping. Utilizes Vagrant virtualbox interface and puppet provisioning to create and execute scraping of web content to structured data quickly and easily without modifying your core system.

Scrapebox is a common infrastructure for powering web crawlers and scrapers. This infrastructure can be used to create structured data from various web resources to power data catalogs and applications.

Installation
===================
First, [install Vagrant for your host operating system](http://www.vagrantup.com/downloads.html). Vagrant runs virtual machines inside VirtualBox on your host OS. We use
a common image and configure it using Vagrant (Puppet) so that all developers have the same runtime environment.

To start the virtual machine type
```vagrant up```

Wait for installation and setup to complete (several minutes), then browse to
```http://localhost:9001/static/main.html```

