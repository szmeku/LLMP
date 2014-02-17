# == Class: php
#
# Installs PHP5 and necessary modules. Sets config files.
#

class php {
  package { [
            'php',
            'php-mysql',
            'php-cli',
             # 'php5-cgi',
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
             # 'php5-xdebug',
             # 'php5-xmlrpc',
             # 'php5-xsl'
             ]:
    ensure => present;
  }

  file {

    '/etc/php.ini':
      source  => 'puppet:///modules/php/php.ini',
      require => Package['php'];
  }

}


include composer