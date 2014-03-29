##Make sure all the packages are up to date

Exec {
    path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/node/node-default/bin/" ],
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
  gunicorn   => true,
}

#Note, manually installing python dev, as above package doesn't seem to do it
$mypackages = ["libxml2-dev", "libxslt-dev", "python-dev", "libffi-dev"]
package {$mypackages:
  ensure    => "installed"
}->
python::requirements { '/vagrant/requirements.txt': }

python::gunicorn { 'vhost':
    ensure      => present,
    mode        => 'wsgi',
    dir         => '/vagrant/scrapebox/web',
    bind        => '192.168.33.10:80'
}

exec {'initdb':
  command     => 'python manage.py syncdb',
  directory   => '/vagrant',

}
