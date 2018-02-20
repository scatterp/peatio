# Load the rails application
require File.expand_path('../application', __FILE__)


# Initialize the rails application
Peatio::Application.initialize!
class ActiveRecord::ConnectionAdapters::AbstractMysqlAdapter
  NATIVE_DATABASE_TYPES[:primary_key] = "int(11) auto_increment PRIMARY KEY"
end