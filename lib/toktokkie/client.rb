module Toktokkie
  class Client
    REQUEST_DEFAULTS = {
      timeout: 10 # seconds
    }

    def initialize(key:, secret:, url:)
      @key = key
      @secret = secret
      @url = url
    end

    def create_event(payload: {}, tags: [], recipients_payload: [])
      response = connection.post("api/v1/events") do |request|
        request.body = {
          payload:,
          tags:,
          recipients_payload:
        }.to_json
      end
    end

    protected

    def connection
      @connection ||= Faraday.new(
        url: @url,
        request: REQUEST_DEFAULTS,
        headers: {
          "Content-Type" => "application/json",
          "X-TOKTOK-KEY" => @key,
          "X-TOKTOK-SECRET" => @secret,
        },
      )
    end
  end
end
