class OwnersController < ApplicationController
    get '/signup' do
        erb :'/owners/signup'
    end

    
    post '/signup' do
        user = Owner.new(params)
            if user.save
                session[:user_id] = user.id
                redirect '/adoptables'
            else
                @error = "Invalid info for login"
                erb :'/owners/signup'
            end
    end
end