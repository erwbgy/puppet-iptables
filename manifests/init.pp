class iptables (
  $use_hiera = true
) {
  stage { 'first': before => Stage['main'] }
  class { 'iptables::clean': stage => 'first' }
  include iptables::clean
  include iptables::config
  include iptables::update
  include iptables::install
  include iptables::service
  if $use_hiera {
    $iptables = hiera_hash('iptables')
    if !$iptables {
      include iptables::default
    }
    else {
      $allow_tcp = $iptables['allow_tcp']
      $allow_udp = $iptables['allow_udp']
      $drop_tcp  = $iptables['drop_tcp']
      $drop_udp  = $iptables['drop_udp']
      # May not work with arrays in which case restructure YAML
      if $allow_tcp {
        create_resources( 'iptables::allow', $allow_tcp, { protocol => 'tcp' } )
      }
      if $allow_udp {
        create_resources( 'iptables::allow', $allow_udp, { protocol => 'udp' } )
      }
      if $drop_tcp {
        create_resources( 'iptables::drop',  $drop_tcp,  { protocol => 'tcp' } )
      }
      if $drop_udp {
        create_resources( 'iptables::drop',  $drop_udp,  { protocol => 'udp' } )
      }
    }
  }
  else {
    include iptables::default
  }
}
