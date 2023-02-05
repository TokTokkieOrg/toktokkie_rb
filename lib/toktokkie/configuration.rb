module Toktokkie
  class Configuration
    DEFAULT_URL = "https://www.toktokkie.io"

    attr_accessor :key, :secret, :url

    def initialize
      self.url = DEFAULT_URL if blank?(url)
    end

    def usable?
      %i[key secret url].none? do |setting|
        blank?(send(setting))
      end
    end

    private

    def blank?(var)
      var.to_s.strip.length.zero?
    end
  end
end
