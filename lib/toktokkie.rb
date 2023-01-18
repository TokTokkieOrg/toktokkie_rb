# frozen_string_literal: true

require "faraday"

require_relative "toktokkie/version"
require_relative "toktokkie/configuration"
require_relative "toktokkie/client"

module Toktokkie
  ConfigurationError = Class.new(StandardError)

  class << self
    def configuration
      @configuration ||= Toktokkie::Configuration.new
    end

    def reset_configuration
      @configuration = nil
    end

    def client
      @client ||= begin
        raise ConfigurationError, "Missing configuration information" unless configuration.usable?
        Toktokkie::Client.new(
          key: configuration.key,
          secret: configuration.secret,
          url: configuration.url
        )
      end
    end

    def configure
      yield configuration
    end
  end
end
