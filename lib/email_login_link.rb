require "email_login_link/version"
require "provider_urls"
require 'resolv'

module EmailLoginLink 

  def self.known_login_url?(email_address)
    domain = get_domain(email_address)
    if $urls.has_key?(domain)
      return true
    elsif check_if_google_apps?(domain)
      return true
    else
      return false
    end
  end

  def self.login_url(email_address)
    domain = get_domain(email_address)
    return $urls[domain]
  end

  private
    def self.get_domain(email_address)
      return email_address.gsub(/.+@([^.]+.+)/, '\1').downcase
    end

    def self.get_mx_record(domain)
      begin
        mx_resource = Resolv::DNS::Resource::IN::MX
        return Resolv::DNS.new.getresource(domain, mx_resource).exchange.to_s
      rescue Exception => e
        return false
      end
      
    end

    def self.check_if_google_apps?(domain)
      mx_record = get_mx_record(domain)
      if mx_record && mx_record.include?("google")
        return true
      else
        return false
      end
    end
end
