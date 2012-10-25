class iptables::config {
  # defaults
  File {
    owner => 'puppet',
    group => 'puppet',
    mode  => '0600',
  }
  file { '/root/iptables.d':
    ensure => directory,
    mode   => '0700',
  }
  file { '/root/iptables.d/update':
    ensure  => present,
    mode    => '0700',
    source  => 'puppet:///modules/iptables/update',
    notify  => Class['iptables::update'],
    require => File['/root/iptables.d'],
  }
}
