require File.expand_path('../lib/smart_proxy_dns_netdot/dns_netdot_version', __FILE__)
require 'date'

Gem::Specification.new do |s|
  s.name        = 'smart_proxy_dns_netdot'
  s.version     = Proxy::Dns::Netdot::VERSION
  s.date        = Date.today.to_s
  s.license     = 'GPLv3'
  s.authors     = ['Vlad Grigorescu']
  s.email       = ['vladg@illinois.edu']
  s.homepage    = 'https://github.com/theforeman/smart_proxy_dns_netdot'

  s.summary     = "NetDot DNS provider plugin for Foreman's smart proxy"
  s.description = "NetDot DNS provider plugin for Foreman's smart proxy"

  s.files       = Dir['{config,lib,bundler.d}/**/*'] + ['README.md', 'LICENSE']
  s.test_files  = Dir['test/**/*']

  s.add_development_dependency('rake')
  s.add_development_dependency('mocha')
  s.add_development_dependency('test-unit')
end
