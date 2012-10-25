define iptables::allow (
  $port,
  $protocol = 'tcp'
) {
  include iptables
  file { "/root/iptables.d/allow_${protocol}_${port}_${title}":
    ensure  => file,
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0600',
    require => Class['iptables'],
    notify  => Class['iptables::update'],
  }
}
