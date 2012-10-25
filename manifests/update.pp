class iptables::update {
  exec { 'update-iptables':
    command     => '/root/iptables.d/update.sh',
    notify      => Class['iptables::service'],
    refreshonly => true,
  }
}
