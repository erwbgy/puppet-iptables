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
      $ports = $iptables['ports']
      if $ports {
        create_resources( 'iptables::rule', $ports )
      }
    }
  }
  else {
    include iptables::default
  }
}
