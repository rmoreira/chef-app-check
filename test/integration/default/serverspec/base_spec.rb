require 'serverspec'

# Required by serverspec
set :backend, :exec

describe "Install Recipe" do

  describe file('/etc/service/test_check/check') do
    it { should be_file }
  end

  describe command('/etc/service/test_check/check') do
    its(:exit_status) { should eq 0 } 
  end

end