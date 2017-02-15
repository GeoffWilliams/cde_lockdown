# Aix_tidy::Cde
#
# Disable remote logins
class cde_lockdown::remote {

  #
  # Copy /usr/dt/config/Xconfig to /etc/dt/config if it does not already exist
  exec { "copy /etc/dt/config/Xconfig":
    creates => "/etc/dt/config/Xconfig",
    command => "/bin/cp /usr/dt/config/Xconfig /etc/dt/config/Xconfig",
  }

  comment_line { "/etc/dt/config Dtlogin.requestPort: 0":
    ensure  => uncommented,
    path    => "/etc/dt/config/Xconfig",
    match   => 'Dtlogin.requestPort:\\s+0',
    require => Exec["copy /etc/dt/config/Xconfig"],
  }
}
