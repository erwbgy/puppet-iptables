class iptables::default {
  # Enable SSH access
  iptables::allow { 'iptables': port => 22,  protocol => 'tcp', }
  # Enable SNMP access
  iptables::allow { 'iptables': port => 161, protocol => 'tcp', }
  iptables::allow { 'iptables': port => 161, protocol => 'udp', }

  # Drop commonly probed ports
  # DROP telnet
  iptables::drop { 'iptables': port => 23,   protocol => 'tcp', }
  # DROP epmap
  iptables::drop { 'iptables': port => 135,  protocol => 'tcp', }
  # DROP netbios
  iptables::drop { 'iptables': port => 137,  protocol => 'tcp', }
  iptables::drop { 'iptables': port => 137,  protocol => 'udp', }
  iptables::drop { 'iptables': port => 138,  protocol => 'tcp', }
  iptables::drop { 'iptables': port => 138,  protocol => 'udp', }
  iptables::drop { 'iptables': port => 139,  protocol => 'tcp', }
  # DROP Microsoft DS
  iptables::drop { 'iptables': port => 445,  protocol => 'tcp', }
  # DROP SQL server
  iptables::drop { 'iptables': port => 1433, protocol => 'tcp', }
  iptables::drop { 'iptables': port => 1433, protocol => 'udp', }
  iptables::drop { 'iptables': port => 1434, protocol => 'tcp', }
  iptables::drop { 'iptables': port => 1434, protocol => 'udp', }
  # DROP SSC-agent
  iptables::drop { 'iptables': port => 2967, protocol => 'udp', }
}
