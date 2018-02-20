unless Object.new.respond_to? :to_query and Object.new.respond_to? :to_param

  require 'cgi' unless defined?(CGI) && defined?(CGI::escape)

  class Object
    def to_param
      to_s
    end

    def to_query(key)
      "#{CGI.escape(key.to_param)}=#{CGI.escape(to_param.to_s)}"
    end
  end

  class NilClass
    def to_param
      self
    end
  end

  class TrueClass
    def to_param
      self
    end
  end

  class FalseClass
    def to_param
      self
    end
  end

  class Array
    def to_param
      collect(&:to_param).join '/'
    end

    def to_query(key)
      prefix = "#{key}[]"

      if empty?
        nil.to_query(prefix)
      else
        collect { |value| value.to_query(prefix) }.join '&'
      end
    end
  end

  class Hash
    def to_query(namespace = nil)
      collect do |key, value|
        unless (value.is_a?(Hash) || value.is_a?(Array)) && value.empty?
          value.to_query(namespace ? "#{namespace}[#{key}]" : key)
        end
      end.compact.sort! * '&'
    end

    alias_method :to_param, :to_query
  end
end
