#!/usr/bin/env ruby

require "webrick"

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
  def do_GET (request, response)
    if request.query["name"]
      response.status = 200
      response['cookies'] = {"name":"#{request.query["name"]}"}
      response.body = "Response for GET Request with cookie"
    else
      response.body="Response for GET Request with no parameters"
    end

  end

  def do_POST (request, response)
      response.status = 200
      response['cookies'] = {"name":"#{request.query["name"]}"}
      response.body = "Response for POST Request"
  end

end

server = WEBrick::HTTPServer.new(:Port => 1234)

server.mount "/", MyServlet

trap("INT") {
  server.shutdown
}

server.start