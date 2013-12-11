class profile::base(
   $enviroment    = 'dev'
   )
 {

  #include profile::autofs
  #include profile::root
  #include profile::sudoers
 # include profile::ssh
  #include profile::puppet::agent
  #include profile::ntp
  include profile::motd
  
 # include profile::selinux
  include profile::yum
  include profile::git
  include profile::networking
  include profile::shells
  include profile::base::packages
}