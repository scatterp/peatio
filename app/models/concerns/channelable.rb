module Channelable
  extend ActiveSupport::Concern

  included do
    def self.category
      self.name.underscore.split('_').first.pluralize
    end
  end

  def kls
    "#{self.class.category}/#{key}".camelize.constantize
  end

end
