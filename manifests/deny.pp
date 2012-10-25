define iptables::deny (
  $port,
  $protocol = 'tcp'
) {
  file { "${title}_iptables_deny_${protocol}_${port}":
    ensure  => file,
    name    => "/root/iptables.d/deny_${protocol}_${port}",
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0600',
    require => Class['iptables'],
    notify  => Class['iptables::update'],
  }
}
