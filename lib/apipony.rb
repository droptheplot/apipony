require 'apipony/engine'

require 'apipony/base'
require 'apipony/documentation'
require 'apipony/section'
require 'apipony/endpoint'
require 'apipony/response'
require 'apipony/request'
require 'apipony/parameter'
require 'apipony/response_attribute'
require 'apipony/example_response'

module Apipony

  ##
  # This allows you to define a common sub-type of attributes.
  # A typical example is something like a list of users. If you want to 
  # display all users who created an image, who subscribe to a channel, or who
  # are in a group, it may be useful if the information on those users is in a
  # common format. This lets you define one common format, which you can then
  # merge in to other attributes.
  # = Example
  #     Apipony.define_attribute_type :user_stub do
  #       attribute :name
  #       attribute :id
  #     end
  def self.define_attribute_type(name, **params, &block)
    a = Apipony::ResponseAttribute.new("", **params, &block)
    Apipony::ResponseAttribute.define_type(name, a)
  end

  def self.defined_subtypes
    Apipony::ResponseAttribute.defined_subtypes
  end

end
