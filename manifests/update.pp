class iptables::update {
  exec { 'update-iptables':
    command     => '/var/lib/puppet/workspace/iptables.d/update.sh',
    notify      => Class['iptables::service'],
    refreshonly => true,
  }
}
