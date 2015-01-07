# Private class, do not use directly.
# Takes care about the xend-config.sxp.

class xen::config (
  $xendconfigfile,
  $xendconfig,
) {

  file { $xendconfigfile:
    ensure  => 'present',
    owner   => 'root',
    group   => '0',
    mode    => '0644',
    content => template('xen/xend-config.sxp.erb'),
  }

}
