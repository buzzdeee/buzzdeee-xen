# == Class: xen
#
# Full description of class xen here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'xen':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Sebastian Reitenbach <sebastia@l00-bugdead-prods.de>
#
# === Copyright
#
# Copyright 2014 Sebastian Reitenbach, unless otherwise noted.
#
class xen (
  $override_xendconfig = $xen::params::xendconfig,
  $override_packages   = $xen::params::packages,
  $xendconfigfile      = $xen::params::xendconfigfile,
  $service_ensure      = $xen::params::service_ensure,
  $service_enable      = $xen::params::service_enable,
  $xenvms              = undef,
  $install_provision_script = false,
  $xenvmdir            = $xen::params::xenvmdir,
  $ossettings          = undef,
  $vmstoredir          = undef,
) inherits xen::params {
  $xendconfig = deep_merge($xen::params::xendconfig, $override_xendconfig)
  $packages   = deep_merge($xen::params::packages, $override_packages)

  class { 'xen::install':
    packages                 => $packages,
    packages_defaults        => $xen::params::packages_defaults,
    install_provision_script => $install_provision_script,
    xenvmdir                 => $xenvmdir,
    ossettings               => $ossettings,
    vmstoredir               => $vmstoredir,
  }

  class { 'xen::config':
    xendconfigfile => $xendconfigfile,
    xendconfig     => $xendconfig,
  }

  class { 'xen::service':
    service_ensure => $service_ensure,
    service_enable => $service_enable,
  }

  if $xenvms {
    create_resources(xen::vmconfig, $xenvms)
  }

  Class['xen::install'] ->
  Class['xen::config'] ~>
  Class['xen::service']
}
