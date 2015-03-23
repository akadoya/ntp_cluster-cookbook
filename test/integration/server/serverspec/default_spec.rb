require 'spec_helper'

describe 'et_ntp::server' do
  context 'installs /etc/ntp.conf' do
    describe file '/etc/ntp.conf' do
      its(:content) { is_expected.to match(/server 0[a-z0-9\.]+pool\.ntp\.org/) }
      its(:content) { is_expected.to match(/server 1[a-z0-9\.]+pool\.ntp\.org/) }
      its(:content) { is_expected.to match(/peer _default-ntp-1b\.priv\.evertrue\.com/) }
      its(:content) { is_expected.to match(/peer _default-ntp-1c\.priv\.evertrue\.com/) }
    end
  end

  context 'should listen on port 123' do
    describe port 123 do
      it { is_expected.to be_listening.on('127.0.0.1').with('udp') }
      it { is_expected.to be_listening.on(host_inventory['ipaddress']).with('udp') }
    end
  end
end
