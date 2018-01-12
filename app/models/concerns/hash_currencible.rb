module HashCurrencible
  extend ActiveSupport::Concern

  included do
    def currency_obj
      YmlCurrency.find_by_code(attributes[:currency])
    end
  end
end
