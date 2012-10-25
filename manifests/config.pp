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
  file { '/root/iptables.d/header':
    ensure  => present,
    source  => 'puppet:///modules/iptables/header',
    notify  => Class['iptables::update'],
    require => File['/root/iptables.d'],
  }
  file { '/root/iptables.d/footer':
    ensure  => present,
    source  => 'puppet:///modules/iptables/footer',
    notify  => Class['iptables::update'],
    require => File['/root/iptables.d'],
  }
  file { '/root/iptables.d/drop':
    ensure  => present,
    source  => 'puppet:///modules/iptables/drop',
    notify  => Class['iptables::update'],
    require => File['/root/iptables.d'],
  }
  file { '/root/iptables.d/update.sh':
    ensure  => present,
    mode    => '0700',
    source  => 'puppet:///modules/iptables/update.sh',
    notify  => Class['iptables::update'],
    require => File['/root/iptables.d'],
  }
}
