require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'capybara/webkit'
require 'spec_helper.rb'
require 'yaml'

Capybara.default_driver = :webkit
Capybara.javascript_driver = :webkit
Capybara.default_wait_time = 5

describe "WebsiteTest" do
  class WebsiteObject < Struct.new(:url, :user, :password); end

  let(:site) do
    # First load the config file and all its attributes
    yaml = YAML::load(File.open('config.yaml'))
    WebsiteObject.new(yaml['site'], yaml['user'], yaml['password'])
  end


  it "Homepage can be hit" do
    visit site.url
  end

  it "login works" do
    visit "#{site.url}/user"
    login_to_site(site.user, site.password)
    verify_login_worked
  end


end
