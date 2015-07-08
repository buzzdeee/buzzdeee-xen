# Private class, do not use directly.
# The parameters that steer the module.

class xen::params {
  $packages = {
    'xen' => {},
    'xen-tools' => {},
    'virt-manager' => {},
  }

  $packages_defaults = {
    ensure => 'installed',
  }
  $xendconfigfile = '/etc/xen/xend-config.sxp'
  $xendconfig = {
    xendrelocationserver     => true,
    xendrelocationport       => '8002',
    xendrelocationaddress    => '',
    xendrelocationhostsallow => 'all',
    dom0minmem               => '4096',
    enabledom0balooning      => false,
    totalavailablememory     => '0',
    dom0cpus                 => '0',
  }
  $service_enable = true
  $service_ensure = 'running'


  $xenvmdir = '/etc/xen/vm'
}
