# Cde_lockdown::xservers
#
# Lock down /etc/dt/confg/Xservers if it exists.  Note - permissions set in
# init.pp
class cde_lockdown::xservers {
  $etc_xservers       = "/etc/dt/config/Xservers"
  $etc_xconfig        = "/etc/dt/config/Xconfig"
  $usr_xconfig        = "/usr/dt/config/Xconfig"
  $cp_xconfig         = "cp ${usr_xconfig} ${etc_xconfig}"
  $tmp_xconfig        = "${etc_xconfig}.tmp"

  $test_cp_file       = "test -f ${etc_xservers} && ! test -f ${etc_xconfig}"

  $replace_file       = "> ${tmp_xconfig} && mv ${tmp_xconfig} ${etc_xconfig}"

  $run_fix_bad_line   =
    "awk '(\$1 == \"Dtlogin.servers:\") { \$0 =\"Dtlogin*servers: ${etc_xservers}\"} {print}' ${etc_xconfig} ${replace_file}"
  $run_test_bad_line  = "test -f ${etc_xservers} && grep '^Dtlogin.servers' ${etc_xconfig}"

  $install_exec       = "install ${etc_xconfig}"

  # Install Xconfig if Xserver present (copy from /usr...)
  exec { $install_exec:
    command => $cp_xconfig,
    onlyif  => $test_cp_file,
    path    => ['/usr/bin', '/bin'],
  }

  # Next up, replace the line if we need to
  exec { "${etc_xservers} lockdown change bad line":
    command => $run_fix_bad_line,
    onlyif  => $run_test_bad_line,
    path    => ['/usr/bin','/bin'],
    require => Exec[$install_exec],
  }
}
