$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'apipony/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'apipony'
  s.version     = Apipony::VERSION
  s.authors     = ['Sergey Novikov']
  s.email       = ['novikov359@gmail.com']
  s.homepage    = 'https://github.com/droptheplot/apipony'
  s.summary     = 'Easy Rails API documentation.'
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '>= 4.2.4'
  s.add_dependency 'sass', '>= 3.4.19'
  s.add_dependency 'jquery-rails', '>= 4.0.4'

  s.add_development_dependency 'sqlite3', '~> 1.3.11'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'faker', '~> 1.6', '>= 1.6.1'
  s.add_development_dependency 'rspec-rails', '~> 3.4', '>= 3.4.0'
  s.add_development_dependency 'factory_girl_rails', '~> 4.5', '>= 4.5.0'
  s.add_development_dependency 'database_cleaner', '~> 1.3', '>= 1.3.0'
end
