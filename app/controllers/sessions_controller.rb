class SessionsController < ApplicationController

    get '/login' do
        erb :'/owners/login'
    end

    post '/login' do
        if params["username"].empty? || params["password"].empty?
            @error = "Username and/or password must contain characters."
            erb :'owners/login'
        else
            user = Owner.find_by(username: params["username"])
                if user && user.authenticate(params["password"])
                session[:user_id] = user.id
                redirect '/adoptables'
        else
                @error = "Account not found"
                erb :'owners/login'
            end 
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end

end
