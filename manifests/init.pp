class iptables {
  define port ($port, $protocol='tcp') {
    @file { "/var/lib/puppet/workspace/iptables.d/allow_${protocol}_${port}":
      owner   => 'puppet',
      group   => 'puppet',
      mode    => '0600',
      content => "-A INPUT -m state --state NEW -m ${protocol} -p ${protocol} --dport ${port} -j ACCEPT\n",
      require => Class["iptables::config"],
      notify  => Class["iptables::update"],
    }
  }
  define allow ($port, $protocol='tcp') {
    realize( File["/var/lib/puppet/workspace/iptables.d/allow_${protocol}_${port}"] )
  }
  include iptables::virtual, iptables::config, iptables::update, iptables::install, iptables::service
}
