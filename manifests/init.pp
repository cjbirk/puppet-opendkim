# OpenDKIM Module

class opendkim (
  $domain               = $opendkim::params::domain,
  $selector             = $opendkim::params::selector,
  $publickey            = $opendkim::params::publickey,
  $privatekey           = $opendkim::params::privatekey,
  $package_name         = $opendkim::params::package_name,
  $package_ensure       = $opendkim::params::package_ensure,
  $service_name         = $opendkim::params::service_name,
  $autorestart          = $opendkim::params::autorestart,
  $autorestart_rate     = $opendkim::params::autorestart_rate,
  $log_why              = $opendkim::params::log_why,
  $syslog               = $opendkim::params::syslog,
  $syslog_success       = $opendkim::params::syslog_success,
  $mode                 = $opendkim::params::mode,
  $canonicalization     = $opendkim::params::canonicalization,
  $external_ignore_list = $opendkim::params::external_ignore_list,
  $internal_hosts       = $opendkim::params::internal_hosts,
  $keytable             = $opendkim::params::keytable,
  $refilekeytable       = $opendkim::params::refilekeytable,
  $signing_table        = $opendkim::params::signing_table,
  $signature_algorithm  = $opendkim::params::signature_algorithm,
  $trusted_hosts        = $opendkim::params::trusted_hosts,
  $thosts               = $opendkim::params::thosts,
  $socket               = $opendkim::params::socket,
  $pidfile              = $opendkim::params::pidfile,
  $umask                = $opendkim::params::umask,
  $userid               = $opendkim::params::userid,
  $temporary_directory  = $opendkim::params::temporary_directory,
  $pathconf             = $opendkim::params::pathconf,
  $owner                = $opendkim::params::owner,
  $group                = $opendkim::params::group,
) inherits opendkim::params {

  # Install package
  class { '::opendkim::install':
    package_ensure => $package_ensure,
    package_name   => $package_name,
  }

  # Configure required config files
  class { '::opendkim::config':
    domain       => $domain,
    selector     => $selector,
    publickey    => $publickey,
    privatekey   => $privatekey,
    thosts       => $thosts,
    service_name => $service_name,
    package_name => $package_name,
    notify       => Service[$service_name],
  }
  
  # Manage the service
  class { '::opendkim::service':
    package_name => $package_name,
  }

}
