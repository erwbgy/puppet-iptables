define iptables::allow (
  $port,
  $protocol = 'tcp'
) {
  file { "${title}_iptables_allow_${protocol}_${port}":
    ensure  => 'file',
    name    => "/root/iptables.d/allow_${protocol}_${port}",
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0600',
    content => "-A INPUT -m state --state NEW -m ${protocol} -p ${protocol} --dport ${port} -j ACCEPT\n",
    require => Class['iptables::config'],
    notify  => Class['iptables::update'],
  }
}
