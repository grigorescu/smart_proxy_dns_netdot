require 'test_helper'
require 'smart_proxy_dns_netdot/dns_netdot_configuration'
require 'smart_proxy_dns_netdot/dns_netdot_plugin'

class DnsNetdotDefaultSettingsTest < Test::Unit::TestCase
  def test_default_settings
    Proxy::Dns::Netdot::Plugin.load_test_settings({})
    assert_equal "default_value", Proxy::Dns::Netdot::Plugin.settings.required_setting
    assert_equal "/must/exist", Proxy::Dns::Netdot::Plugin.settings.required_path
  end
end
