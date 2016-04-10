# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

 # provides support for Cross-Origin Resource Sharing (CORS) for Rack compatible web applications.
use Rack::Cors do

  allow do
    origins '*'
    resource '*', :headers => :any, :methods =>  [:get, :post, :delete, :put, :patch, :options, :head]
  end
  
end
