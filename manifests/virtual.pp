class iptables::virtual {
  iptables::port{ 'ssh_tcp':    port => '22',   protocol => 'tcp' }
  iptables::port{ 'dns_tcp':    port => '53',   protocol => 'tcp' }
  iptables::port{ 'dns_udp':    port => '53',   protocol => 'udp' }
  iptables::port{ 'http_tcp':   port => '80',   protocol => 'tcp' }
  iptables::port{ 'snmp_tcp':   port => '161',  protocol => 'tcp' }
  iptables::port{ 'snmp_udp':   port => '161',  protocol => 'udp' }
  iptables::port{ 'https_tcp':  port => '443',  protocol => 'tcp' }
  iptables::port{ 'stomp_tcp':  port => '6163', protocol => 'tcp' }
  iptables::port{ 'tomcat_tcp': port => '8080', protocol => 'tcp' }
  iptables::port{ 'puppet_tcp': port => '8140', protocol => 'tcp' }
  iptables::port{ 'wso2_1_tcp': port => '8280', protocol => 'tcp' }
  iptables::port{ 'wso2_2_tcp': port => '8243', protocol => 'tcp' }
  iptables::port{ 'wso2_3_tcp': port => '9443', protocol => 'tcp' }
}
