# == Class: php
#
# Installs PHP5 and necessary modules. Sets config files.
#
class lighttpd {
  package { [
             'lighttpd',
             'lighttpd-fastcgi',
             ]:
      ensure => present;
  }



  file {  

    ["/tmp/lighttpd", "/tmp/lighttpd/cache",
      "/tmp/lighttpd/cache/uploads"]:
    ensure => "directory",
    owner  => "lighttpd",
    group  => "lighttpd";

    "/var/log/lighttpd":
    ensure => "directory",
    owner  => "lighttpd",
    group  => "lighttpd";
    

    '/etc/lighttpd/lighttpd.conf':
    ensure => present,
    source  => 'puppet:///modules/lighttpd/lighttpd.conf',
    notify  => Service["lighttpd"],
    require => Package['lighttpd'];

    "/etc/lighttpd/conf.d/fastcgi.conf":
    ensure => present,
    source => "puppet:///modules/lighttpd/fastcgi.conf",
    notify  => Service["lighttpd"],
    require => Package["lighttpd-fastcgi"];
    # notify => Exec["enable-mod-fastcgi"];

  
    # '/etc/lighttpd/conf-enabled/10-fastcgi.conf':
    # ensure => link,
    # target => '/etc/lighttpd/conf-available/10-fastcgi.conf',
    # notify  => Service["lighttpd"],
    # require => File['/etc/lighttpd/conf-available/10-fastcgi.conf'];
    
  }

  # exec { "enable-mod-fastcgi":
  #   command => "/usr/bin/sudo /usr/sbin/lighttpd-enable-mod fastcgi",
  #   refreshonly => true,
  # }

  service { 'lighttpd':
    ensure    => running,
    enable    => true,
    require   => File["/etc/lighttpd/conf.d/fastcgi.conf"],
}

  # service { "lighttpd":
  #   enable => true,    
  #  
  # }

  # service { "lighttpd"
  #   ensure => "running",  
  #   require "/etc/lighttpd/conf-available/10-fastcgi.conf", 
  # }
  


  # file_line { 'fix_pathinfo':
  #   path  => '/etc/php5/cgi/php.ini',
  #   line  => 'cgi.fix_pathinfo=1',
  #   require => Package['lighttpd'],
  # }

}
