# Simple Web Client
require 'socket'
require 'json'

$socket = TCPSocket.open("localhost", 3000)  # Connect to server

#---------------------- HANDLE CLIENT REQUEST ------------------------

def select_request
  p "What kind of request would you like to send? (GET/POST)"
  choice = gets.chomp.downcase
  choice == "get" ? get_request : post_request
end

def get_request
  send_request("get", "GET /basic.html HTTP/1.0\r\n")
end

def post_request
  p "Thanks for signing up to 'The Odin Project'!"
  p "What's you viking name?"
  name = gets.chomp.downcase
  p "What's you viking mail?"
  email = gets.chomp.downcase
  content = {:viking => {:email => email, :name => name}}
  request = "POST /thanks.erb HTTP/1.0\r\n" + content.to_json
  send_request("post", request)
end

def send_request(type, request)
  $socket.print(request)     # Send request
  p "Your #{type} request has been send succesfully!"
  listen_for_response
end

#---------------------- HANDLE SERVER RESPONSE ------------------------
def listen_for_response
  response = $socket.read    # Listen for and read complete response
  p "Server response received!"
  # Split response on linebreaks and remove trailing spaces
  arr = response.split("\n").collect{|e| e.strip}
  (arr[0].include? "404") ? (arr.each {|elem| p elem}) : show_response(arr)
end

def show_response(arr)
  headers = arr[0..(arr.index("<!DOCTYPE html>") - 1)] # Get all the elements (headers) until HTML starts
  html = arr[arr.index("<!DOCTYPE html>")..-1].join # Get HTML
  headers.each do |head| # Show headers
    p head
  end
  print html # Show html
end

#---------------------- START ------------------------

select_request
