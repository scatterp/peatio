require 'database_cleaner'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation, {:except => %w[currencies]})
  end

  config.before(:all) do
    DatabaseCleaner.start
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.after(:all) do
    DatabaseCleaner.clean
  end
end
