class Device < ActiveRecord::Base

  belongs_to :user
  has_many :feeds

  validates_presence_of :name, :user_id, :gcm_id
  
  attr_accessible :name, :requested, :user_id, :gcm_id

  def request_feed

    # send gcm message to device
  
    require "net/https"
    require "uri"

    headers = {"Content-Type" => "application/json","Authorization" => "key=AIzaSyDeS0-SLsrMeYo8e5CdKEwFIO5ENXq3Hjc"}
    url = URI.parse("https://android.googleapis.com/gcm/send")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    data = {:registration_ids=>[self.gcm_id],:data=>{:requested=>true,:port => 2000}}
    
    response, dat = http.post(url.path, data.to_json, headers)
    puts response.body
    
    Device.open_socket
    
    # TODO Handle GCM failure
    return response.code
  end

  def self.open_socket
    require 'socket'
    
    puts "opening socket"
    socket = TCPServer.new("10.0.1.32",2000)
    connection = socket.accept
    while line = connection.gets
      puts line
    end
  end

end

