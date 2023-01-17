module Toktokkie
  class Configuration
    attr_accessor :key, :secret

    def usable?
      %i[key secret].none? do |setting|
        "#{send(setting)}".strip.length.zero?
      end
    end
  end
end
