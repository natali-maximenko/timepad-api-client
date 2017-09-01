module Timepad
  class Client
    API_URI = 'https://api.timepad.ru'
    VERSION = '1'
    FORMAT = 'json'
    attr_reader :token

    def initialize(token = nil)
      @token = token unless token.nil?
    end

    def request(action, params = {})
      uri = make_uri(action, params)
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end

    def event
      @event ||= Timepad::Event.new(self)
    end

    def order
      @order ||= Timepad::Order.new(self)
    end

  private
    def make_query(params)
      params.map{|key, value| value.nil? ? "" : "#{key}=#{URI::encode value.to_s}"}.join('&')
    end

    def make_uri(action, params = {})
      params.nil? ? params = {'token': @token} : params.merge!({'token': @token})
      query = make_query(params)
      URI("#{API_URI}/v#{VERSION}/#{action}.#{FORMAT}?#{query}")
    end
  end
end
