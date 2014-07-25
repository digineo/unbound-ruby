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

               :rcode, Unbound::Bindings::RCode, # int rcode

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
      case self[:rcode]
      when :noerror
        self[:answer_packet].read_bytes(self[:answer_len]) if self[:answer_len] > 0
      when :nxdomain
        raise Resolv::DNS::Config::NXDomain.new(self[:qname])
      else
        raise ResultError, self[:rcode]
      end
    end

    def to_resolv
      if ap = answer_packet
        msg = Resolv::DNS::Message.decode(ap)
        msg.secure    = self[:secure] == 1
        msg.bogus     = self[:bogus] == 1
        msg.why_bogus = self[:why_bogus]
        msg
      end
    end
  end

  class Result < FFI::Struct
    include ResultLayout
  end
end


