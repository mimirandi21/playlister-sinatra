class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  require 'sinatra/base'
require 'rack-flash'


  enable :sessions
  use Rack::Flash
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  
  get '/' do
    erb :index
  end
  

  post '/set-flash' do
    # Set a flash entry
    flash[:notice] = "Successfully created song."

    # Get a flash entry
    flash[:notice] 

    # Set a flash entry for only the current request
    flash.now[:notice] = "Successfully created song."
  end

  patch '/set-flash' do
    # Set a flash entry
    flash[:notice] = "Successfully updated song."

    # Get a flash entry
    flash[:notice] 

    # Set a flash entry for only the current request
    flash.now[:notice] = "Successfully updated song."
  end
end