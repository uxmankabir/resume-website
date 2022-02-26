class ApplicationController < ActionController::Base
  before_action :monitor_website_visitors

  private

  def monitor_website_visitors
    Visitor.first_or_create(ip_address: client_ip)
    @visitors_count = Visitor.count
  end

  def client_ip
    ip=Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
    p '*'*80
    p "Ip Address: #{ip.ip_address}" if ip
    p "Remote IP: #{request.remote_ip}" 
    p '*'*80
    request.remote_ip
  end

end
