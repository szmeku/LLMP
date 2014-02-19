# == Class: php
#
# Installs PHP5 and necessary modules. Sets config files.
#

class php {
    package { [
                'php5',
                'php5-mysql',
                'php5-cli',
                'php5-cgi',
                'php5-xdebug',
                'php5-curl',
                'php5-dev',
                'php5-gd',
                'php5-imagick',
                'php5-mcrypt',
                'php5-memcache',
                'php5-pspell',
                'php5-sqlite',
                'php5-tidy',
                'php5-xmlrpc',
                'php5-xsl',
                'php-apc',
              ]:
              ensure => present;
    }

    exec {
        'move xdebug.so':
        command => "/usr/bin/sudo /usr/bin/find /usr/lib/php5/ -name 'xdebug.so' -exec mv {} /usr/lib/php5/ ';'",
        require => Package['php5-xdebug'];
    }


    file {
        '/usr/lib/php5/xdebug.so':
        ensure => present,
        before =>  File['/etc/php5/mods-available/xdebug.ini'],
        require => Exec['move xdebug.so'];


        '/etc/php5/cgi/php.ini':
        source  => 'puppet:///modules/php/php.ini',
        require => Package['php5-cgi'];


        '/etc/php5/mods-available/xdebug.ini':
        ensure => present,
        source  => 'puppet:///modules/php/xdebug.ini';
      
        '/etc/php5/conf.d/20-xdebug.conf':
        ensure => link,
        target => '/etc/php5/mods-available/xdebug.ini',
        require => File['/etc/php5/mods-available/xdebug.ini'];


        '/etc/php5/mods-available/apc.ini':
        ensure => present,
        source  => 'puppet:///modules/php/apc.ini',
        require => Package["php-apc"];
      
        '/etc/php5/conf.d/10-apc.conf':
        ensure => link,
        target => '/etc/php5/mods-available/apc.ini',
        require => File['/etc/php5/mods-available/apc.ini'];
    }

    include composer

}


