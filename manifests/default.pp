class iptables::default {
  # Enable SSH access
  iptables::allow { 'iptables-default-tcp-22':  port => 22,  protocol => 'tcp', }
  # Enable SNMP access
  iptables::allow { 'iptables-default-tcp-161': port => 161, protocol => 'tcp', }
  iptables::allow { 'iptables-default-udp-161': port => 161, protocol => 'udp', }

  # Drop commonly probed ports
  # DROP telnet
  iptables::drop { 'iptables-default-tcp-23':   port => 23,   protocol => 'tcp', }
  # DROP epmap
  iptables::drop { 'iptables-default-tcp-135':  port => 135,  protocol => 'tcp', }
  # DROP netbios
  iptables::drop { 'iptables-default-tcp-137':  port => 137,  protocol => 'tcp', }
  iptables::drop { 'iptables-default-udp-137':  port => 137,  protocol => 'udp', }
  iptables::drop { 'iptables-default-tcp-138':  port => 138,  protocol => 'tcp', }
  iptables::drop { 'iptables-default-udp-138':  port => 138,  protocol => 'udp', }
  iptables::drop { 'iptables-default-tcp-139':  port => 139,  protocol => 'tcp', }
  # DROP Microsoft DS
  iptables::drop { 'iptables-default-tcp-445':  port => 445,  protocol => 'tcp', }
  # DROP SQL server
  iptables::drop { 'iptables-default-tcp-1433': port => 1433, protocol => 'tcp', }
  iptables::drop { 'iptables-default-udp-1433': port => 1433, protocol => 'udp', }
  iptables::drop { 'iptables-default-tcp-1434': port => 1434, protocol => 'tcp', }
  iptables::drop { 'iptables-default-udp-1434': port => 1434, protocol => 'udp', }
  # DROP SSC-agent
  iptables::drop { 'iptables-default-udp-2967': port => 2967, protocol => 'udp', }
}
