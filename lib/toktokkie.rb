# frozen_string_literal: true

require_relative "toktokkie/version"
require_relative "toktokkie/configuration"

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
        puts "Usable?: #{configuration.usable?}"
        unless configuration.usable?
          raise ConfigurationError, "Missing key and/or secret"
        end
      end
    end

    def configure
      yield configuration
    end
  end
end
