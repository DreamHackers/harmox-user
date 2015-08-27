require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :request do
  it "response successfully with an HTTP 200 status code" do
    get "/home/index"
    expect(response).to be_success
  end
end
