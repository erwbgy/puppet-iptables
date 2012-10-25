define iptables::allow (
  $port,
  $protocol = 'tcp'
) {
  file { "${title}_iptables_allow_${protocol}_${port}":
    ensure  => file,
    name    => "/root/iptables.d/allow_${protocol}_${port}",
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0600',
    require => Class['iptables'],
    notify  => Class['iptables::update'],
  }
}
