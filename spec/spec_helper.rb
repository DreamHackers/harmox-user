require 'rails_helper'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
end
