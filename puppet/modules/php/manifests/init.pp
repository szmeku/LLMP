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
                # 'php5-curl',
                # 'php5-dev',
                # 'php5-gd',
                # 'php5-imagick',
                # 'php5-mcrypt',
                # 'php5-memcache',
                # 'php5-mysql',
                # 'php5-pspell',
                # 'php5-sqlite',
                # 'php5-tidy',
                # 'php5-xmlrpc',
                # 'php5-xsl'
              ]:
              ensure => present;
    }

    file {

        '/etc/php5/cgi/php.ini':
        source  => 'puppet:///modules/php/php.ini',
        require => Package['php5-cgi'];


        '/etc/php5/mods-available/xdebug.ini':
        ensure => present,
        source  => 'puppet:///modules/php/xdebug.ini',
        require => Package["php5-xdebug"];

      
        '/etc/php5/conf.d/20-xdebug.conf':
        ensure => link,
        target => '/etc/php5/mods-available/xdebug.ini',
        require => File['/etc/php5/mods-available/xdebug.ini'];
    }

    include composer

}


