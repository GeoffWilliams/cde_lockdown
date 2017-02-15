@test "suid bit removed (1)" {
  ! test -u /usr/dt/bin/dtaction
}

@test "suid bit removed (2)" {
  ! test -u /usr/dt/bin/dtappgather
}

@test "suid bit removed (3)" {
  ! test -u /usr/dt/bin/dtprintinfo
}

@test "suid bit removed (4)" {
  ! test -u /usr/dt/bin/dtsession
}
