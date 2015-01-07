# Private class, do not use directly.
# Takes care about the xend service.

class xen::service (
  $service_ensure,
  $service_enable,
) {
  service { 'xend':
    ensure => $service_ensure,
    enable => $service_enable,
  }
}
