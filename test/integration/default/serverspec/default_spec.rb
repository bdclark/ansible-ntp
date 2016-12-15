require 'spec_helper'

case os[:family]
when 'redhat', 'centos'
  describe service('ntpd') do
    it { should be_running }
  end
when 'debian', 'ubuntu'
  describe service('ntp') do
    it { should be_running }
  end
  describe file('/etc/timezone') do
    it { should be_file }
    it { should contain 'America/Indiana/Indianapolis' }
  end
end
