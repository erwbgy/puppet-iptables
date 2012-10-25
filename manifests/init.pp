class iptables {
  include iptables::config
  include iptables::update
  include iptables::install
  include iptables::service
}
