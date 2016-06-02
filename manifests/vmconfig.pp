# Private defined type, do not use directly.
# Takes care about the VM configuration
# files in /etc/xen/vm.

define xen::vmconfig (
  $vmuuid,
  $vmmemory,
  $vmvcpus,
  $builder,
  $vmdisks,
  $vmvifs,
  $ensure = 'present',
  $vmname = $title,
  $vmcpus = undef,
  $vmdescription = undef,
  $vmmaxmem = undef,
  $vmon_poweroff = undef,
  $vmon_reboot = undef,
  $vmon_crash = undef,
  $vmlocaltime = undef,
  $vmkeymap = undef,
  $vmapic = undef,
  $vmacpi = undef,
  $vmbootorder = undef,
  $vmbootloader = undef,
  $vmkernel = undef,
  $vmbootargs = undef,
  $vmextra = undef,
  $vmnographic = undef,
  $vmvfb = undef,
  $vmostype = undef,
  $vmpae = undef,
  $vmserial = undef,
  $vmdevicemodel = undef,
  $vmviridian = undef,
  $vmvncunused = undef,
  $vmvnc = undef,
  $vmstdvga = undef,
  $vmhpet = undef,
  $vmusb = undef,
  $vmusbdevice = undef,
) {

  if $builder != 'hvm' and $builder != 'linux' {
    fail("Valid values for 'builder are: 'hvm' or 'linux', not ${builder}")
  }

  file { "/etc/xen/vm/${vmname}":
    ensure  => $ensure,
    owner   => 'root',
    group   => '0',
    mode    => '0644',
    content => template('xen/vmconfig.erb'),
  }

}
