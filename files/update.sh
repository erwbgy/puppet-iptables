#!/bin/bash
/bin/cat /var/lib/puppet/workspace/iptables.d/header /var/lib/puppet/workspace/iptables.d/allow_* /var/lib/puppet/workspace/iptables.d/drop /var/lib/puppet/workspace/iptables.d/footer > /etc/sysconfig/iptables 2>/dev/null
exit 0
