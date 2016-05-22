#
# server.rb
#
require 'childprocess'
require 'selenium/webdriver/common/socket_poller'
require 'net/http'

module Browsermob
  #
  #
  #
  class Server
    class Error < StandardError; end
    attr_accessor :port, :timeout, :background, :log

    def initialize(jar, opts = {})
      raise Errno::ENOENT, jar unless File.exist?(jar)

      @jar        = jar
      @host       = "127.0.0.1"
      @port       = opts.fetch(:port, 8080)
      @timeout    = opts.fetch(:timeout, 30)
      @background = opts.fetch(:background, false)
      @log        = opts[:log]

      @additional_args = []
    end

    def start
      process.start
      poll_for_service

      process.wait unless @background
    end

    def stop
      stop_process if @process
      poll_for_shutdown

      @log_file.close if @log_file
    end

    def proxy_url
      "http://#{@host}:#{@port}/proxy"
    end

    def <<(arg)
      if arg.kind_of?(Array)
        @additional_args += arg
      else
        @additional_args << arg.to_s
      end
    end

    private

    def self.net_http
      http_proxy = ENV['http_proxy'] || ENV['HTTP_PROXY']

      if http_proxy
        http_proxy = "http://#{http_proxy}" unless http_proxy.start_with?("http://")
        uri = URI.parse(http_proxy)

        Net::HTTP::Proxy(uri.host, uri.port)
      else
        Net::HTTP
      end
    end

    def stop_process
      return unless @process.alive?

      begin
        @process.poll_for_exit(5)
      rescue ChildProcess::TimeoutError
        @process.stop
      end
    rescue Errno::ECHILD
      # already dead
    ensure
      @process = nil
    end

    def process
      @process ||= (
        cp = ChildProcess.build("java", "-jar", @jar, "-port", @port.to_s, *@additional_args)
        io = cp.io

        if @log.kind_of?(String)
          @log_file = File.open(@log, "w")
          io.stdout = io.stderr = @log_file
        elsif @log
          io.inherit!
        end

        cp.detach = @background

        cp
      )
    end

    def poll_for_service
      unless socket.connected?
        raise Error, "remote server not launched in #{@timeout} seconds"
      end
    end

    def poll_for_shutdown
      unless socket.closed?
        raise Error, "remote server not stopped in #{@timeout} seconds"
      end
    end

    def socket
      @socket ||= Selenium::WebDriver::SocketPoller.new(@host, @port, @timeout)
    end

  end # => 
end # => 