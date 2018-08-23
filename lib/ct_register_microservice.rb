require 'ct_register_microservice/engine'
require 'multi_json'
require 'ct_register_microservice/api'
require 'ct_register_microservice/http_service'
require 'ct_register_microservice/errors'
require 'ostruct'

module CtRegisterMicroservice
  class << self
    attr_accessor :http_service, :config

    def configure
      yield config
    end

    def config
      @config ||= OpenStruct.new
    end
  end

  def self.http_service=(service)
    @http_service = service
  end

  def self.make_request(options, credentials = {})
    http_service.make_request(options, credentials)
  end

  self.http_service = HTTPService
end
