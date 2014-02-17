# == Class: mysql
#
# Installs MySQL server, sets config file, and loads database for dynamic site.
#
class mysql {
  package { ['mysql-server']:
    ensure => present;
  }

  service { 'mysqld':
    ensure  => running,
    require => Package['mysql-server'];
  }

  file { '/etc/my.cnf':
    source  => 'puppet:///modules/mysql/my.cnf',
    require => Package['mysql-server'],
    notify  => Service['mysqld'];
  }

  exec { 'set-mysql-password':
    unless  => 'mysqladmin -uroot -proot status',
    command => "mysqladmin -uroot password root",
    path    => ['/bin', '/usr/bin'],
    require => Service['mysqld'];
  }

  # exec { 'load-dynamic-sql':
  #   command => 'mysql -u root -proot < /vagrant/sites/dynamic.sql',
  #   path    => ['/bin', '/usr/bin'],
  #   require => Exec['set-mysql-password'];
  # }
}
