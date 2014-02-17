# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {

  package { 'epel-release':
    ensure => present,
    provider => 'rpm',
    source =>
    'http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm',
    before => Exec['yum update'];
  }

  exec {   

    'yum update':
      command => '/usr/bin/sudo /usr/bin/yum update -y';
    
    # 'puppet module install puppetlabs/stdlib':
    #   command => '/usr/bin/puppet module install puppetlabs/stdlib';
  }

  # host { 'hostmachine':
  #   ip => '192.168.0.1';
  # }

  file {
    '/home/vagrant/.bashrc':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/baseconfig/bashrc';
  }
}
