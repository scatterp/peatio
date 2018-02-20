require 'logger'
require 'json'
require 'eventmachine'
require 'faye/websocket'

module PeatioAPI
  class StreamingClient < Client

    def initialize(options={})
      super
      @endpoint = options[:endpoint] || 'wss://peatio.com:8080'
      @logger   = options[:logger] || Logger.new(STDOUT)
    end

    def run(&callback)
      EM.run do
        ws = Faye::WebSocket::Client.new(@endpoint)

        ws.on(:open) do |event|
          @logger.info "Connected."
        end

        ws.on(:message) do |event|
          msg = JSON.parse(event.data)

          key = msg.keys.first
          data = msg[key]
          case key
          when 'challenge'
            ws.send JSON.dump(@auth.signed_challenge(data))
          else
            begin
              callback.call msg
            rescue
              @logger.error "Failed to process message: #{payload}"
              @logger.error $!
            end
          end
        end

        ws.on(:close) do |event|
          @logger.info "Closed. Code: #{event.code}, Reason: #{event.reason || 'none'}"
          ws = nil
          EM.stop
        end

      end

    end

  end
end
