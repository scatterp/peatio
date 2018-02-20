require 'json'
require 'net/http'
require_relative 'client/version'

module PeatioAPI
  class Client

    attr :auth

    def initialize(options={})
      options = options.symbolize_keys
      setup_auth_keys options
      @endpoint = options[:endpoint] || 'https://yunbi.com'
      @timeout  = options[:timeout]  || 60
    end

    def get_public(path, params={})
      uri = URI("#{@endpoint}#{path}")
      uri.query = URI.encode_www_form params

      request(:get, path, nil, params) do |http, _|
        http.request_get(uri.request_uri)
      end
    end

    def get(path, params={})
      check_auth!

      uri = URI("#{@endpoint}#{path}")

      request(:get, path, @auth, params) do |http, signed_params|
        uri.query = URI.encode_www_form signed_params
        http.request_get(uri.request_uri)
      end
    end

    def post(path, params={})
      check_auth!

      request(:post, path, @auth, params) do |http, signed_params|
        http.request_post(path, signed_params.to_query)
      end
    end

    private

    def request(action, path, auth, params={})
      uri = URI("#{@endpoint}#{path}")
      params = auth.signed_params action.to_s.upcase, path, params if auth

      http = Net::HTTP.new(uri.hostname, uri.port)
      http.open_timeout = @timeout
      http.use_ssl = true if @endpoint.start_with?('https://')

      http.start do |http|
        parse yield(http, params)
      end
    end

    def parse(response)
      JSON.parse response.body
    rescue JSON::ParserError
      {http_error: {code: response.code, body: response.body}}
    end

    def setup_auth_keys(options)
      if options[:access_key] && options[:secret_key]
        @access_key = options[:access_key]
        @secret_key = options[:secret_key]
        @auth       = Auth.new @access_key, @secret_key
      else
        #raise ArgumentError, 'Missing access key and/or secret key'
      end
    end

    def check_auth!
      raise ArgumentError, 'Missing access key and/or secret key' if @auth.nil?
    end
  end
end
