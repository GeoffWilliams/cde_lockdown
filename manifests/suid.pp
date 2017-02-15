# Aix_tidy::Cde
#
# Remove SUID/SGID from CDE binaries
class cde_lockdown::suid {

  #
  # remove SUID/SGID from CDE binaries
  #
  $bad_files = [
    "/usr/dt/bin/dtaction",
    "/usr/dt/bin/dtappgather",
    "/usr/dt/bin/dtprintinfo",
    "/usr/dt/bin/dtsession",
  ]

  file { $bad_files:
    mode => "ug-s",
  }
}
