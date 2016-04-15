# require 'spec_helper'
# ENV['RAILS_ENV'] ||= 'test'
# require File.expand_path('../../config/environment', __FILE__)
# # Prevent database truncation if the environment is production
# abort("The Rails environment is running in production mode!") if Rails.env.production?
# require 'rspec/rails'

ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

require 'factory_girl'


ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  
  config.filter_rails_from_backtrace!
 
end
