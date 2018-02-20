unless {}.respond_to? :symbolize_keys
  class Hash
    def transform_keys
      return enum_for(:transform_keys) unless block_given?
      result = self.class.new
      each_key do |key|
        result[yield(key)] = self[key]
      end
      result
    end

    def symbolize_keys
      transform_keys{ |key| key.to_sym rescue key }
    end
  end
end
