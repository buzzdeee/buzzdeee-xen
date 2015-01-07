# Private class, do not use directly.
# Takes care about the packages to install.

class xen::install (
  $packages,
  $packages_defaults,
) {

  create_resources(package, $packages, $packages_defaults)

}
