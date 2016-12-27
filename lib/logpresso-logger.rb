require 'socket'

module LogpressoLogger

  class Sender
    def initialize(remote, port = 514, options={})
      @socket = UDPSocket.new
      @remote = remote
      @port = port
    end

    def transmit(message)
      @socket.send message, 0, @remote, @port
    end 

    alias_method :write, :transmit

    def close
      @socket.close
    end
  end

  def self.new(protocol, remote, port, options = {}) 
    Sender.new(remote, port, options)
  end

end
