# OpenDKIM Params
class opendkim::params {
  $domain               = undef
  $selector             = undef
  $publickey            = undef
  $privatekey           = undef
  $package_name         = 'opendkim'
  $package_ensure       = installed
  $service_name         = 'opendkim'
  $autorestart          = 'Yes'
  $autorestart_rate     = '10/1h'
  $log_why              = 'Yes'
  $syslog               = 'Yes'
  $syslog_success       = 'Yes'
  $mode                 = 's'
  $canonicalization     = 'relaxed/simple'
  $external_ignore_list = 'refile:/etc/opendkim/TrustedHosts'
  $internal_hosts       = 'refile:/etc/opendkim/TrustedHosts'
  $keytable             = 'KeyTable'
  $refilekeytable       = 'refile:/etc/opendkim/KeyTable'
  $signing_table        = 'SigningTable'
  $refilesigntable      = 'refile:/etc/opendkim/SigningTable'
  $signature_algorithm  = 'rsa-sha256'
  $trusted_hosts        = 'TrustedHosts'
  $thosts               = undef
  $socket               = 'inet:8891@localhost'
  $pidfile              = '/var/run/opendkim/opendkim.pid'
  $umask                = '022'
  $userid               = 'opendkim:opendkim'
  $temporary_directory  = '/var/tmp'
  $pathconf             = '/etc/opendkim'
  $pathkeys             = '/etc/opendkim/keys'
  $owner                = 'opendkim'
  $group                = 'opendkim'
  }
