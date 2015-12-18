# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'email_login_link/version'

Gem::Specification.new do |spec|
  spec.name          = "email_login_link"
  spec.version       = EmailLoginLink::VERSION
  spec.authors       = ["Mark Hoad"]
  spec.email         = ["mark@afterwire.net"]

  spec.summary       = %q{Return the appropriate login URL for a given E-Mail address}
  spec.description   = %q{Given an e-mail address this gem will check to see if it is able to determine 
                          the appropriate login URL for that service. For example user@gmail.com would
                          return https://accounts.google.com/ServiceLogin?service=mail&continue=https://mail.google.com/mail/}
  spec.homepage      = "http://www.afterwire.net/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
