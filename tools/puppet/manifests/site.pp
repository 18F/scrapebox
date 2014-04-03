##Make sure all the packages are up to date

Exec {
    path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin/" ],
    timeout   => 0,
}

class { 'apt':
  always_apt_update    => true,
  update_timeout       => undef
}

#Set system timezone to UTC
class { "timezone":
  timezone => 'UTC',
}

class { 'python':
  version    => '2.7',
  pip        => true,
  dev        => true,
  virtualenv => false,
  gunicorn   => false,
}

#Note, manually installing python dev, as above package doesn't seem to do it
$mypackages = ["libxml2-dev", "libxslt-dev", "python-dev", "libffi-dev"]
package {$mypackages:
  ensure    => "installed",
}

#Install Portia
#file { "/portia":
#    ensure => "directory",
#    purge  => true, # purge all unmanaged junk
#    force  => true, # also purge subdirs and links
#    recurse => true, # honestly don't know diff b/t this and purge
#}->
exec{ 'clone portia':
    command   => "git clone https://github.com/scrapinghub/portia.git /portia",
    creates   => "/portia",
}->
#python::requirements{"/portia/slyd/requirements.txt":}->
exec{"install_requirements":
  command   => 'pip install -r requirements.txt',
  cwd   => '/portia/slyd',
  require => Class['python'],
  path    => '/usr/bin/',
}->
exec{'run_portia':
    command   => "twistd slyd",
    cwd       => "/portia/slyd",
    unless    => ["ps -ef | grep '[t]wistd'"],
}


