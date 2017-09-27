
case os[:family]
when 'redhat'
  describe service('ntpd') do
    it { should be_running }
  end
when 'debian'
  describe service('ntp') do
    it { should be_running }
  end
  describe file('/etc/timezone') do
    it { should be_file }
    it { should be_owned_by 'root' }
    its('mode') { should cmp '0644' }
    its('content') { should eq "America/Indiana/Indianapolis\n" }
  end
end
