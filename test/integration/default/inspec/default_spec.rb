
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

describe file('/etc/ntp.conf') do
  it { should be_file }
  its('content') { should match %r{^driftfile /var/lib/ntp/ntp.drift} }
  its('content') { should match %r{^pool 0.pool.ntp.org iburst\n^pool 1.pool.ntp.org iburst\n^pool 2.pool.ntp.org iburst\n^pool 3.pool.ntp.org iburst\n} }
  its('content') { should match %r{^restrict -4 default kod notrap nomodify nopeer noquery} }
  its('content') { should match %r{^restrict -6 default kod notrap nomodify nopeer noquery} }
end
