class iptables (
  $use_hiera       = true,
  $allow_icmp      = true,
  $allow_localhost = true,
  $log_failures    = true
) {
  if ! defined(Stage['first']) {
    stage { 'first': before => Stage['main'] }
  }
  class { 'iptables::clean': stage => 'first' }
  include iptables::update
  include iptables::install
  include iptables::service
  if $use_hiera {
    $iptables = hiera_hash('iptables', undef)
    if !$iptables {
      include iptables::default
    }
    else {
      class { 'iptables::config':
        allow_icmp => $iptables['allow_icmp'] ? {
          undef   => $allow_icmp,
          default => $iptables['allow_icmp'],
        },
        allow_localhost => $iptables['allow_localhost'] ? {
          undef   => $allow_localhost,
          default => $iptables['allow_localhost'],
        },
        log_failures => $iptables['log_failures'] ? {
          undef   => $log_failures,
          default => $iptables['log_failures'],
        }
      }
      $ports = $iptables['ports']
      if $ports {
        create_resources( 'iptables::rule', $ports )
      }
    }
  }
  else {
    class { 'iptables::config':
      allow_icmp      => $allow_icmp,
      allow_localhost => $allow_localhost,
      log_failures    => $log_failures,
    }
    include iptables::default
  }
}
