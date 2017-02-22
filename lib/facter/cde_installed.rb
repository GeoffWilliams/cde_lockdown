Facter.add(:cde_installed) do
  setcode do
    Dir.exists?("/usr/dt/config")
  end
end
