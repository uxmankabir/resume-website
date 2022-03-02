require 'net/http'
require 'net/https'

module AbstractApi

  class IpGeolocation

    def initialize(client_ip)
      @client_ip = client_ip
    end

    def call

      begin
        uri = URI("https://ipgeolocation.abstractapi.com/v1/?api_key=#{Rails.application.credentials.abstract_api_key}&ip_address=#{client_ip}")

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER

        request =  Net::HTTP::Get.new(uri)
        response = http.request(request)
        {exception: false, response_code: response.code, response_body: JSON.parse(response.body)}
      rescue => exception
        {exception: true, error: exception.message}
      end

    end

    private
    attr_accessor :client_ip

  end

end
