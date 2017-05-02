require 'socket'
require 'time'
require 'json'
require "erb"

# Multithreaded server which can listen for multiple requests
$server = TCPServer.open(3000)   # Socket to listen on port 3000

#---------------------- HANDLE CLIENT REQUESTS ------------------------

def handle_get_request(file, http, client)
 if File.file?(file) # Check if file exists
  p "#{file} requested" 
  response =  %{#{http} 202 ok
    Date: #{Time.now}
    Content-type: text/html
    Size: #{file.size}
    #{File.read(file)}}
  else
    response =  %{#{http} 404 not found
        Date: #{Time.now}
      }
  end
  send_response(client,response)
end

def handle_post_request(file, http, client, body="")
  if File.file?(file) # Check if file exists
    params = JSON.parse body
    erb_template = ERB.new File.read file # Generate a new erb copy based on thanks.erb
    @name, @email = params["viking"]["name"], params["viking"]["email"]
    form_letter = erb_template.result(binding) # Populate file with variables
    File.open("thanks.html", "w") do |file|
      file.puts form_letter # Write generated html to file
    end

    response =  %{#{http} 202 ok
      Date: #{Time.now}
      Content-type: text/html
      Size: #{file.size}
      #{File.read("thanks.html")}}
  else
    response =  %{#{http} 404 not found
        Date: #{Time.now}
      }
  end
  send_response(client, response)
end

#---------------------- SEND CLIENT RESPONSE ------------------------

def send_response(client, response)
  client.puts(response) # Send response to client 
  p "Send response succesfully!"
  client.close
end

#---------------------- SERVER LOOP ------------------------

def start_server
  loop do                          
    Thread.start($server.accept) do |client|
      print(client, " connected succesfully!\n")
      # I couldn't find a decent method to get all lines from client, so I just read 500k bytes :/
      request = client.recv(500000).split 
      # Request type, File requested, HTTP version, Client request body 
      type, file, http, body = request[0], request[1].gsub("/",""), request[2], request[3..-1].join   
      case type
        when "GET" then handle_get_request(file, http, client)
        when "POST" then handle_post_request(file, http, client, body)
      end
    end
  end
end

#---------------------- START ------------------------

start_server
