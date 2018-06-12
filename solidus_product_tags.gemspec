# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_variant_tags'
  s.version     = '1.0.0'
  s.summary     = 'Adds tags such as "limited edition", "sold out", etc. to spree products.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Andrew Scott'
  s.email     = 'ams@keemail.me'
  s.homepage  = 'https://cogentia.io'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  solidus_version = [">= 1.2.0", "< 3"]

  s.add_dependency "solidus_core", solidus_version

  s.add_development_dependency 'capybara'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'factory_bot'
end
