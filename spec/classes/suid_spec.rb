require 'spec_helper'
describe 'cde_lockdown::suid' do
  let :facts do
    {
      :os => {
        :family => "Solaris"
      }
    }
  end

  context "catalog compiles" do
    it { should compile}
  end

  context 'with default values for all parameters' do
    it { should contain_class('cde_lockdown::suid') }
  end
end
