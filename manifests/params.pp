# == Class: timezone::params
#
# Initializes some parameters based on the distro.
#
class timezone::params {
  case $::operatingsystem {
    /(Ubuntu|Debian|Gentoo|CentOS|Amazon)/: {
      $package = 'tzdata'
      $zoneinfo_dir = '/usr/share/zoneinfo/'
      $config_file = '/etc/localtime'
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }
}
