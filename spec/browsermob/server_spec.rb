require 'browsermob/server'

describe Browsermob::Server do
  let(:mock_process) { double(ChildProcess).as_null_object }
  let(:mock_poller)  { double("SocketPoller", :connected? => true, :closed? => true)}

  it "raises an error if the jar file does not exist" do
    expect {
      Browsermob::Server.new("doesnt-exist.jar")
    }.to raise_error(Errno::ENOENT)
  end

  it "uses the given jar file and port" do
    expect(File).to receive(:exist?).with("browsermob-server-test.jar").and_return(true)

    expect(ChildProcess).to receive(:build).
                 with("java", "-jar", "browsermob-server-test.jar", "-port", "1234").
                 and_return(mock_process)

    server = Browsermob::Server.new("browsermob-server-test.jar", :port => 1234, :background => true)
    allow(server).to receive(:socket).and_return(mock_poller)

    server.start
  end

  it "waits for the server process by default" do
    expect(File).to receive(:exist?).with("browsermob-server-test.jar").and_return(true)

    expect(ChildProcess).to receive(:build).
                 with("java", "-jar", "browsermob-server-test.jar", "-port", "8080").
                 and_return(mock_process)

    server = Browsermob::Server.new("browsermob-server-test.jar")
    allow(server).to receive(:socket).and_return(mock_poller)

    expect(mock_process).to receive(:wait)
    server.start
  end

  it "adds additional args" do
    expect(File).to receive(:exist?).with("browsermob-server-test.jar").and_return(true)

    expect(ChildProcess).to receive(:build).
                 with("java", "-jar", "browsermob-server-test.jar", "-port", "8080", "foo", "bar").
                 and_return(mock_process)

    server = Browsermob::Server.new("browsermob-server-test.jar", :background => true)
    allow(server).to receive(:socket).and_return(mock_poller)

    server << ["foo", "bar"]

    server.start
  end

  it "raises Selenium::Server::Error if the server is not launched within the timeout" do
    expect(File).to receive(:exist?).with("browsermob-server-test.jar").and_return(true)

    poller = double('SocketPoller')
    expect(poller).to receive(:connected?).and_return(false)

    server = Browsermob::Server.new("browsermob-server-test.jar", :background => true)
    allow(server).to receive(:socket).and_return(poller)

    expect { server.start }.to raise_error(Browsermob::Server::Error)
  end

  it "sets options after instantiation" do
    expect(File).to receive(:exist?).with("browsermob-server-test.jar").and_return(true)
    server = Browsermob::Server.new("browsermob-server-test.jar")
    expect(server.port).to eq(8080)
    expect(server.timeout).to eq(30)
    expect(server.background).to be false
    expect(server.log).to be_nil

    server.port = 1234
    server.timeout = 5
    server.background = true
    server.log = "/tmp/server.log"
  end
end