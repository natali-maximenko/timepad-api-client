module TimepadApi
  class Client
    attr_reader :token, :api_version, :data_format

    def initialize(token = nil, api_version = 1, data_format = 'json')
      @token = token unless token.nil?
      @api_version = api_version
      @data_format = data_format
    end

    def request(action, params = {})
      uri = make_uri(action, params)
      response = Net::HTTP.get(uri)
      JSON.parse(response)
    end

    def event
      @event ||= TimepadApi::Event.new(self)
    end

    def order
      @order ||= TimepadApi::Order.new(self)
    end

  private
    def make_query(params)
      params.map{|key, value| value.nil? ? "" : "#{key}=#{URI::encode value.to_s}"}.join('&')
    end

    def make_uri(action, params = {})
      api_endpoint = 'https://api.timepad.ru'
      params.nil? ? params = {'token': @token} : params.merge!({'token': @token})
      query = make_query(params)
      URI("#{api_endpoint}/v#{@api_version}/#{action}.#{@data_format}?#{query}")
    end
  end
end
