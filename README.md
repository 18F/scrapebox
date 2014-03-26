Scrapebox
============================

Scrapebox is a common infrastructure for powering web crawlers and scrapers. This infrastructure can be used to create structured data
from various web resources to power data catalogs and applications.

Installation
===================
First, [install Vagrant for your host operating system](http://www.vagrantup.com/downloads.html). Vagrant runs virtual machines inside VirtualBox on your host OS. We use
a common image and configure it using Vagrant (Puppet) so that all developers have the same runtime environment.

To start the virtual machine type
```vagrant up```

Wait for installation and setup to complete (several minutes), then SSH into the virtual machine, start the virtual environment
and change to the synced folder
```
vagrant ssh
cd /vagrant
```

Crawling
===================
Spiders crawl a website, extracting data from the web pages. Each spider is customized for a specific website or set of websites.
You can view the available spiders by running
```scrapy list```

You can start the crawling using the below command:
```
scrapy crawl <spider_name>
```

Scraped data is output as JSON in 'feed.json'. You can change this by editing the settings.py file.
