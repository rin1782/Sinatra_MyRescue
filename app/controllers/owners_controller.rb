class OwnersController < ApplicationController
    get '/signup' do
        erb :'/owners/signup'
    end

    
    post '/signup' do
        user = Owner.new(params)
            if user.username.empty? || user.password.empty?
                @error = "Username and/or password must contain characters."
                erb :'owners/login'
            elsif Owner.find_by(username: user.username)
                @error = "Username Already Exists."
                erb :'owners/signup'
            else
                user.save
                session[:user_id] = user.id
                redirect '/'
            end
    end
end