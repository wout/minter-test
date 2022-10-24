require "http/server"

server = HTTP::Server.new do |context|
  tip = `/cardano/bin/cardano-cli query tip --testnet-magic 1097911063`

  context.response.content_type = "text/plain"
  # context.response.print `ls -la #{context.request.path}`
  # context.response.print `/cardano/bin/cardano-cli --version`
  context.response.print tip
end

address = server.bind_tcp "0.0.0.0", 3003
puts "Listening on http://#{address}"
server.listen
