class iptables {
  stage { 'first': before => Stage['main'] }
  class { 'iptables::clean': stage => 'first' }
  include iptables::clean
  include iptables::config
  include iptables::update
  include iptables::install
  include iptables::service
  include iptables::default
}
