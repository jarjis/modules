class profile::motd {
  if $::kernel == 'Linux' {
    file { '/etc/motd':
      ensure  => file,
      backup  => false,
      content => template('template/motd.erb'),
    }
  }
}