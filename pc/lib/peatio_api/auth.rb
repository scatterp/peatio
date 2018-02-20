module PeatioAPI
  class Auth

    def initialize(access_key, secret_key)
      @access_key = access_key
      @secret_key = secret_key
    end

    def signed_challenge(challenge)
      signature = OpenSSL::HMAC.hexdigest 'SHA256', @secret_key, "#{@access_key}#{challenge}"
      {auth: {access_key: @access_key, answer: signature}}
    end

    def signed_params(verb, path, params={})
      params    = format_params params
      signature = sign verb, path, URI.unescape(params.to_query)
      params.merge(signature: signature)
    end

    def sign(verb, path, params)
      OpenSSL::HMAC.hexdigest 'SHA256', @secret_key, payload(verb, path, params)
    end

    def payload(verb, path, params)
      "#{verb.upcase}|#{path}|#{params}"
    end

    def format_params(params)
      params = params.symbolize_keys
      params[:access_key] ||= @access_key
      params[:tonce]      ||= (Time.now.to_f*1000).to_i
      params
    end

  end
end
