# puppet-iptables

Manage iptables incoming allow and deny rules

The iptables::allow and iptables::deny resources create files under
/root/iptables.d with a filename including the action (allow or deny), the
protocol (tcp or udp) and the port number.  Creating these files triggers an
update script that combines all the entries together into a new
/etc/sysconfig/iptables file and restarts the iptables service.

Use your class name in the resource title to avoid resource clashes if another
module requires the same port to be open or closed.  You don't need to include
the protocol and port in the title like I have done, the resource just needs to
be unique.

## iptables::allow

Allow access to the specified port.

*port*: the incoming port number. Required.

*protocol*: either 'tcp' or 'udp'. Default: 'tcp'

    iptables::allow { 'my-class-tcp-22': port => '22', protocol => 'tcp' }


## iptables::deny

Deny access to the specified port.

*port*: the incoming port number. Required.

*protocol*: either 'tcp' or 'udp'. Default: 'tcp'

    iptables::allow { 'my-class-tcp-21': port => '21', protocol => 'tcp' }

Use your class name in the resource title to avoid resource clashes if another
module requires the same port to be open or closed.  You don't need to include
the protocol and port in the title like I have done, the resource just needs to
be unique.

## Notes

* All attempts to access ports not explicitly allowed or denied are logged to
  syslog

* By default the following commonly probed ports are dropped to avoid filling
  up the logs:

    telnet: tcp/23

    epmap: tcp/135

    netbios: tcp/137, udp/137, tcp/138, udp/138, tcp/139

    Microsoft DS: tcp/445

    Microsoft SQL server: tcp/1433, udp/1433, tcp/1434, udp/1434

    SSC-agent: udp/2967

* By default access is allowed to:

    SSH: tcp/22

    SNMP: tcp/161 and udp/161

* By default ICMP and localhost traffic is allowed

* Allow resources override deny resources so if a port is both allowed and
  denied then it will be allowed in the iptables configuration

## Support

License: Apache License, Version 2.0

GitHub URL: https://github.com/erwbgy/puppet-iptables
