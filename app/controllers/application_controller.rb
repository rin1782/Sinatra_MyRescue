require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :sessions_secret, "active"
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  def current_user
    Owner.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  endk

end
