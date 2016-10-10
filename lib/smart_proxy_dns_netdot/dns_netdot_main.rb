require 'dns_common/dns_common'

module Proxy::Dns::Netdot
  class Record < ::Proxy::Dns::Record
    include Proxy::Log

    attr_reader :netdot_server, :netdot_username, :netdot_password

    def initialize(netdot_server, netdot_username, netdot_password)
      @required_setting = netdot_server
      @required_setting = netdot_username
      @required_setting = netdot_password
    end

    # Calls to these methods are guaranteed to have non-nil parameters
    def create_a_record(fqdn, ip)
      case a_record_conflicts(fqdn, ip) #returns -1, 0, 1
        when 1
          raise(Proxy::Dns::Collision, "'#{fqdn} 'is already in use")
        when 0 then
          return nil
        else
          # FIXME: add a forward 'A' record with fqdn, ip
      end
    end

    def create_aaaa_record(fqdn, ip)
      case aaaa_record_conflicts(fqdn, ip) #returns -1, 0, 1
        when 1
          raise(Proxy::Dns::Collision, "'#{fqdn} 'is already in use")
        when 0 then
          return nil
        else
          # FIXME: add a forward 'AAAA' record with fqdn, ip
      end
    end

    def create_ptr_record(fqdn, ptr)
      case ptr_record_conflicts(fqdn, ptr_to_ip(ptr)) #returns -1, 0, 1
        when 1
          raise(Proxy::Dns::Collision, "'#{fqdn} 'is already in use")
        when 0 then
          return nil
        else
          # FIXME: add a reverse 'PTR' record with ip, fqdn
      end
    end

    def remove_a_record(fqdn)
      raise Proxy::Dns::NotFound.new("Cannot find DNS entry for #{fqdn}") unless dns_find(fqdn)
      # FIXME: remove the forward 'A' record with fqdn
    end

    def remove_aaaa_record(fqdn)
      raise Proxy::Dns::NotFound.new("Cannot find DNS entry for #{fqdn}") unless dns_find(fqdn)
      # FIXME: remove the forward 'AAAA' record with fqdn
    end

    def remove_ptr_record(ip)
      raise Proxy::Dns::NotFound.new("Cannot find DNS entry for #{ip}") unless dns_find(ip)
      # FIXME: remove the reverse 'PTR' record with ip
    end
  end
end
