require 'resolv'

Resolv::DNS::Message.class_eval do
  attr_accessor :secure, :bogus, :why_bogus
end
