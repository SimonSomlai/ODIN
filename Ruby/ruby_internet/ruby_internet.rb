#  Making basic server requests
require 'net/http'

def get_web_document(url)
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)
  case response
  when Net::HTTPSuccess
    return response.body
  when Net::HTTPRedirection
    return get_web_document(response['Location'])
  else
    return nil
  end
end

print get_web_document("http://www.truetech.be/nl")

# OR

require "open-uri"
file = open("http://www.truetech.be/index.html")

# Generating HTML from ruby (with markaby)
require "rubygems"
require "markaby"

m = Markaby::Builder.new

m.html do
  head {title "this is the title"}

  body do
    h1 "Hello world"
    h2 "This is the content"
    ul do
      li "first"
      li "second"
    end
  end
end

print m

# Parsing HTML into ruby (with Hpricot)
# Generating HTML
require 'rubygems'
require 'hpricot'

html = <<END_OF_HTML
<html>
  <head>
    <title>This is the page title</title>
  </head>
  <body>
    <h1>Big heading!</h1>
    <p>A paragraph of text.</p>
    <ul><li>Item 1 in a list</li><li>Item 2</li><li class="highlighted">Item
  3</li></ul>
</body>
</html>
END_OF_HTML

doc = Hpricot(html)
puts doc.search("h1").first.inner_html

# Parsing from web
html = get_web_document("http://www.truetech.be/nl")
html = Hpricot(html)
html = html.at(".team-title")
print html.search("h4").inner_html


# Parsing XML to ruby (with REXML)

require 'rexml/document'
xml = <<END_XML
<people>
  <person>
    <name>Peter Cooper</name>
  <gender>Male</gender>
</person>
<person>
  <name>Fred Bloggs</name>
<gender>Male</gender>
</person>
</people>
END_XML
tree = REXML::Document.new(xml)
tree.elements.each("people/person") do |person|
  puts person.get_elements("name").first
end

# ----------------------- Writing A Web Client & Server ---------------------------------------
# Client-side, request information on localhost:3000 
require 'socket'
socket = TCPSocket.open("localhost", 3000) # Normally ip address & port

while line = socket.gets
	p line.chop
end

# Listen to requests from localhost:3000
require 'socket'
server = TCPServer.open(3000)

loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  client.puts(Time.now.ctime)  # Send the time to the client
  client.puts "Closing the connection. Bye!" 
  client.close           
}

# Multithreaded server which can listen for multiple requests
server = TCPServer.open(3000)   # Socket to listen on port 3000
loop {                          # Servers run forever
  Thread.start(server.accept) do |client|
    client.puts(Time.now.ctime) # Send the time to the client
	client.puts "Closing the connection. Bye!"
    client.close                # Disconnect from the client
  end
}

# Simple Web Client
require 'socket'

# This is the HTTP request we send to fetch a file
request = "GET /basic.html HTTP/1.0\r\n\r\n"

socket = TCPSocket.open("localhost", 3000)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Listen for and read complete response
# Split response at first blank line into headers and body
headers,body = response.split("\r\n\r\n", 2) 
print body            


