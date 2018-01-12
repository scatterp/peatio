module ActiveModel
  module Dirty
    def changes_attributes
      HashWithIndifferentAccess[saved_changes.keys.map { |attr| [attr, __send__(attr)] }]
    end

    def changes_attributes_as_json
      ca, json = saved_changes.transform_values(&:first), self.as_json
      json.each do |key, value|
        ca[key.to_s] = value if ca.key?(key)
      end
      ca
    end
  end
end

