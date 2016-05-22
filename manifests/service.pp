# == Class: opendkim::service
class opendkim::service (
  $package_name  = $opendkim::params::package_name,
) inherits opendkim::params {

  service { 'opendkim':
    ensure     => running,
    name       => $package_name,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package[$package_name],
  }
}
