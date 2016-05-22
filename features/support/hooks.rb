#
# hooks.rb
#

# Start the Browsermob Server
server = Browsermob::Server.new("/home/vagrant/Desktop/tools/browsermob-dist-2.1.0.jar")
server.start



Before do |scenario|
    # Do something here before each scenario
    @client = Browsermob::Rest::Api.new
end

After do |scenario|
    # Do something after each scenario
    @client = nil if @client
end

at_exit do
    server.stop unless server.nil?
end