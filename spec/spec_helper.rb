# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
# require 'rspec/autorun'

require 'capybara/rspec'
require 'capybara/rails'
require 'rack_session_access/capybara'
require 'database_cleaner'


Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
 # using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"

  config.include Sorcery::TestHelpers::Rails
  config.include AuthenticationForFeatureRequest, type: :feature

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

Capybara.server_port = 1234
