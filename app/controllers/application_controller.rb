class ApplicationController < ActionController::Base
  before_action :ip_geolocation
  before_action :monitor_website_visitors

  private

  def monitor_website_visitors
    Visitor.find_or_create_by!(ip_address: client_ip)
    @visitors_count = Visitor.count
  end

  def client_ip
    request.remote_ip
  end

  def ip_geolocation
    @ip_geolocation ||= AbstractApi::IpGeolocation.new(client_ip).call
  end

end
