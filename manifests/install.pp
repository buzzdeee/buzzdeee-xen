# Private class, do not use directly.
# Takes care about the packages to install.

class xen::install (
  $packages,
  $packages_defaults,
  $install_provision_script,
  $xenvmdir,
  $ossettingsurl,
  $sourcerepourl,
  $vmstoredir,
) {

  create_resources(package, $packages, $packages_defaults)

  file { '/usr/local/bin/install_vm.sh':
    ensure  => 'present',
    content => template('xen/install_vm.sh.erb'),
    owner   => 'root',
    group   => '0',
    mode    => '0755',
  }

}
