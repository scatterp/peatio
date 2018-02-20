$:.push File.expand_path("../lib", __FILE__)

require "peatio_api/client/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "peatio_client"
  s.version     = PeatioAPI::Client::VERSION
  s.authors     = ["Peatio Opensource"]
  s.email       = ["community@peatio.com"]
  s.homepage    = "https://github.com/peatio/peatio-client-ruby"
  s.summary     = "A ruby client to access Peatio's API."
  s.description = "A ruby client which can access all Peatio's API."
  s.license     = 'MIT'

  s.require_paths = ["lib"]
  s.files       = Dir["{bin,lib}/**/*"] + ["README.markdown"]

  s.add_runtime_dependency 'faye-websocket', '~> 0.9.2'
  s.add_development_dependency 'minitest', '~> 5.5.1'
end
