require "./dusc/*"
require "http/server"

module Dusc
  def self.run
    server = HTTP::Server.new(8080) do |context|
      token = context.request.query_params.fetch("token")
      domain = context.request.query_params.fetch("domain")

      if Handler.call(token: token, domain: domain)
        context.response.content_type = "text/plain"
        context.response.print "it worked"
      else
        context.response.content_type = "text/plain"
        context.response.print "too bad!"
      end
    end

    puts "Listening on http://127.0.0.1:8080"
    server.listen
  end
end

Dusc.run
