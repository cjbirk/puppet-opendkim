# OpenDKIM Configuration
class opendkim::config(
  $domain        = $opendkim::params::domain,
  $selector      = $opendkim::params::selector,
  $publickey     = $opendkim::params::publickey,
  $privatekey    = $opendkim::params::privatekey,
  $keytable      = $opendkim::params::keytable,
  $signing_table = $opendkim::params::signing_table,
  $trusted_hosts = $opendkim::params::trusted_hosts,
  $thosts        = $opendkim::params::thosts,
  $service_name  = $opendkim::params::service_name,
  $package_name  = $opendkim::params::package_name,
  $pathkeys      = $opendkim::params::pathkeys,
  $owner         = $opendkim::params::owner,
  $group         = $opendkim::params::group,
  $pathconf      = $opendkim::params::pathconf,
) inherits opendkim::params {

  # Move our simple OpenDKIM config over
  file {'/etc/opendkim.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('opendkim/opendkim.conf'),
    notify  => Service[$service_name],
    require => Package[$package_name],
  }

  # Make sure that the config dir exists
  file { '/etc/opendkim/':
    ensure  => directory,
    owner   => $owner,
    group   => $group,
    mode    => '0755',
    require => Package[$package_name],
  }

  # Make sure that the keys directory exists
  file { "${pathkeys}/":
    ensure  => directory,
    owner   => $owner,
    group   => $group,
    mode    => '0755',
    require => Package[$package_name],
  }

  # Making sure the directory exists for our domains
  file { "${pathkeys}/${domain}":
    ensure  => directory,
    owner   => $owner,
    group   => $group,
    mode    => '0755',
    notify  => Service[$service_name],
    require => Package[$package_name],
  }

  file { 'opendkim-SigningTable':
    ensure  => 'file',
    path    => "${pathconf}/${signing_table}",
    owner   => $owner,
    group   => $group,
    mode    => '0640',
    content => template('opendkim/SigningTable.erb'),
  }

  file { 'opendkim-KeyTable':
    ensure  => 'file',
    path    => "${pathconf}/${keytable}",
    owner   => $owner,
    group   => $group,
    mode    => '0640',
    content => template('opendkim/KeyTable.erb'),
  }

  file { 'opendkim-TrustedHosts':
    ensure  => 'file',
    path    => "${pathconf}/${trusted_hosts}",
    owner   => $owner,
    group   => $group,
    mode    => '0640',
    content => template('opendkim/TrustedHosts.erb'),
  }

  # Adding the private keys
  file { "${pathkeys}/${domain}/${selector}.private":
    ensure  => 'file',
    content => $privatekey,
    owner   => $owner,
    group   => $group,
    mode    => '0600',
    notify  => Service[$service_name],
    require => Package[$package_name],
  }

  # Adding the public keys
  file { "${pathkeys}/${domain}/${selector}.txt":
    ensure  => 'file',
    content => template('opendkim/pubkey.erb'),
    owner   => $owner,
    group   => $group,
    mode    => '0600',
  }

}
