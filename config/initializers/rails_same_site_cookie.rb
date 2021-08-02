#config/initializers/rails_same_site_cookie.rb
RailsSameSiteCookie.configure do |config|
  config.user_agent_regex = /MyCustomUserAgentString/
end