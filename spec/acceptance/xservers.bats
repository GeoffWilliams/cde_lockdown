@test "correct line present" {
  grep -E '^Dtlogin\*servers:[[:space:]]*/etc/dt/config/Xservers' /etc/dt/config/Xconfig
}

@test "old line gone" {
  ! grep -E '^Dtlogin\.servers:[[:space:]]*Xservers' /etc/dt/config/Xconfig
}
