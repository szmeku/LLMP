# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {

  # package { 'epel-release':
  #   ensure => present,
  #   provider => 'rpm',
  #   source =>
  #   'http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm',
  #   # before => Exec['yum update'];
  # }


  exec {   

    'apt-get update':
      command => '/usr/bin/sudo /usr/bin/apt-get update';
    
    # 'puppet module install puppetlabs/stdlib':
    #   command => '/usr/bin/puppet module install puppetlabs/stdlib';
  # }

  # host { 'hostmachine':
  #   ip => '192.168.0.1';
  }

  file {
    '/home/vagrant/.bashrc':
      owner => 'vagrant',
      group => 'vagrant',
      mode  => '0644',
      source => 'puppet:///modules/baseconfig/bashrc';
  }


  # # firewall
  # include ufw

  # ufw::allow {
  #   "allow-all-from-trusted":
  #   from => "10.0.2.2",
  #   ip => "192.168.33.10",
  #   port => "80";
  # }
}
