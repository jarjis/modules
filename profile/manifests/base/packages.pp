class profile::base::packages{
  
  $package = $::operatingsystem ? {
    default => 'git',
  }
}