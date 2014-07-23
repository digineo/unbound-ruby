require 'ffi'
require 'resolv'
module Unbound
  module ResultLayout
    # TODO Figure out how to determine version of libunbound and, 
    #  thus, proper structure of ub_result
    def self.included(base)
      base.class_eval do
        layout( 
               :qname, :string, # char* qname
               :qtype, :int,    # int qtype
               :qclass, :int,   # int qclass

               :data, :pointer, # char** data
               :len,  :pointer, # int* len

               :canonname, :string, # char* canonname

               :rcode, :int, # int rcode

               :answer_packet, :pointer, # void* answer_packet
               :answer_len, :int,        # int answer_len

               :havedata, :int,  # int havedata

               :nxdomain, :int,   # int nxdomain
               :secure, :int,     # int secure

               :bogus,  :int,       # int bogus
               :why_bogus, :string, # char* why_bogus

               # This wasn't added until unbound version 1.4.20
               #:ttl, :int       # int ttl 
              )

      end
    end

    def answer_packet
      if self[:answer_len] <= 0
        return nil
      end
      self[:answer_packet].read_bytes(self[:answer_len])
    end

    def to_resolv
      if self[:nxdomain] == 1
        raise Resolv::DNS::Config::NXDomain.new(self[:qname])
      elsif ap = answer_packet
        msg = Resolv::DNS::Message.decode(ap)
        msg.secure    = self[:secure] == 1
        msg.bogus     = self[:bogus] == 1
        msg.why_bogus = self[:why_bogus]
        msg
      else
        nil
      end
    end
  end

  class Result < FFI::Struct
    include ResultLayout
  end
end


