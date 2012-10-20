class iptables::config {
  # defaults
  File {
    owner => 'puppet',
    group => 'puppet',
    mode  => '0600',
  }
  file { '/var/lib/puppet/workspace/iptables.d':
    ensure => directory,
  }
  file { '/var/lib/puppet/workspace/iptables.d/header':
    ensure => present,
    source => 'puppet:///modules/iptables/header',
    notify => Class['iptables::update'],
  }
  file { '/var/lib/puppet/workspace/iptables.d/footer':
    ensure => present,
    source => 'puppet:///modules/iptables/footer',
    notify => Class['iptables::update'],
  }
  file { '/var/lib/puppet/workspace/iptables.d/drop':
    ensure => present,
    source => 'puppet:///modules/iptables/drop',
    notify => Class['iptables::update'],
  }
  file { '/var/lib/puppet/workspace/iptables.d/update.sh':
    ensure => present,
    mode   => '0700',
    source => 'puppet:///modules/iptables/update.sh',
    notify => Class['iptables::update'],
  }
}
