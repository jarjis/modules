class profile::git(
  $ensure   = 'installed',
  $package  = $git::params::package,
  $gui      = 'absent',
  $svn      = 'installed',
  $git_root = false
) inherits git::params {

  # ensure statement for the git package overrides svn and gui ensure.
  case $ensure {
    /^installed$|^(\d+)?(\.(x|\*|\d+))?(\.(x|\*|\d+))?(|-(\S+))$/: {
      $ensure_svn = $svn
      $ensure_gui = $gui
    }
    default: {
      $ensure_svn = 'absent'
      $ensure_gui = 'absent'
    }
  }

  package{'git':
    ensure  => $ensure,
    name    => $package,
  }

  package{'git-svn':
    ensure  => $ensure_svn,
    name    => $git::params::svn_package,
  }

  package{'git-gui':
    ensure  => $ensure_gui,
    name    => $git::params::gui_package,
  }

  # Need to consider if this should happen or not.
  # if $git_root {
  #   $root_name    = "root on ${::fqdn}"
  #   $root_email   = "root@${::fqdn}"
  #   git::user{'root':}
  # }

}