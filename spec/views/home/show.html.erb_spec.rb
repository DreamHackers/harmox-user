require 'rails_helper'

RSpec.describe "home/show.html.erb", type: :request do
  it "response successfully with an HTTP 200 status code" do
    get "/home/show"
  end
end
