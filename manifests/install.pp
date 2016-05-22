# OpenDKIM Install
class opendkim::install(
  $package_ensure = $opendkim::params::package_ensure,
  $package_name   = $opendkim::params::package_name,
) inherits opendkim::params {
  package { $package_name:
    ensure => $package_ensure,
    name   => $package_name,
  }

}
