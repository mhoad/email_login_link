require 'spec_helper'

describe EmailLoginLink do
  it 'has a version number' do
    expect(EmailLoginLink::VERSION).not_to be nil
  end

  it 'returns false for domains it does not know the URL for' do
    expect(EmailLoginLink::known_login_url?("user@customdomain.com")).to eq(false)
  end

  it 'returns true for domains it does know the URL for' do
    expect(EmailLoginLink::known_login_url?("user@gmail.com")).to eq(true)
  end

  it 'returns the login URL for known email domains' do
    hotmail_login_url = "https://login.live.com/"
    expect(EmailLoginLink::login_url("user@hotmail.com")).to eq(hotmail_login_url)
  end

  it 'correctly determines if a custom domain has Google Apps enabled' do
    expect(EmailLoginLink::known_login_url?("user@afterwire.com.au")).to eq(true)
  end
end
