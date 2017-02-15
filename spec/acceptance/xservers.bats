@test "correct line present" {
  grep -E '^Dtlogin\*servers:[[:space:]]*/etc/dt/config/Xservers'
}

@test "old line gone" {
  ! grep -E '^Dtlogin\.servers:[[:space:]]*Xservers'
}
