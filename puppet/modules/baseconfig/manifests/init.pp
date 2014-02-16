# == Class: baseconfig
#
# Performs initial configuration tasks for all Vagrant boxes.
#
class baseconfig {
  exec {
    'apt-get update':
      command => '/usr/bin/sudo /usr/bin/apt-get update';
    
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
