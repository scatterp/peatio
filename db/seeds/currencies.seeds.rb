data_file = Rails.root.join('db','seed_data','currencies.yml')
currency_data = YAML.load_file(data_file)


puts "Currencies:".blue
currency_data.each do |currency|
  currency = currency.with_indifferent_access
  currency[:is_tradable] = true
  currency[:code] = currency[:code].upcase
  record = Currency.where(id: currency.delete(:id)).first_or_initialize
  record.update!(currency)
  puts "  %02d: %s".blue % [record.id, record.name]
end
puts