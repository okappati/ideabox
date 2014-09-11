$:.unshift File.expand_path("./../../lib", __FILE__)

require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'rack/test'
require 'nokogiri'
require 'sinatra/base'

require_relative '../lib/app.rb'

describe IdeaBoxApp do
  include Rack::Test::Methods

  def app
    IdeaBoxApp.new
  end

  it "has a heading" do
    get '/'
    html = Nokogiri::HTML(last_response.body)

    assert last_response.ok?
    assert_equal "IdeaBox", html.css('h1').text
  end

  it "requests your idea" do
    get '/'
    html = Nokogiri::HTML(last_response.body)

    assert last_response.ok?
    assert_equal "Your Idea:", html.css('.idea').text
  end

end
