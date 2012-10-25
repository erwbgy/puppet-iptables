define iptables::deny (
  $port,
  $protocol = 'tcp'
) {
  file { "${title}_iptables_deny_${protocol}_${port}":
    ensure  => absent,
    name    => "/root/iptables.d/allow_${protocol}_${port}",
    require => Class['iptables::config'],
    notify  => Class['iptables::update'],
  }
}
