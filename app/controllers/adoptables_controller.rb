class AdoptablesController < ApplicationController


    get '/adoptables/new' do
        require_login
        erb :'/adoptables/new'
    end

    post '/adoptables' do
        pet = current_user.adoptables.new(params)
        if  pet.save
            redirect '/adoptables'
        else
            @error = "Data Invalid: Please enter at least a new dog's name AND description."
            erb :'adoptables/new'
        end
    end

    get '/adoptables' do
        require_login
        @adoptables = Adoptable.all.reverse
        erb :'adoptables/index'
    end

    get '/adoptables/:id' do
        require_login
        @puppy = Adoptable.find_by(id: params[:id])
        @user = current_user
        if @puppy
            erb :'adoptables/show'
        else
            redirect '/adoptables'
        end
    end

    get '/adoptables/:id/edit' do
        require_login
        if @puppy = Adoptable.find(params[:id])
            @user = current_user
            erb :'/adoptables/edit'
        else
            redirect '/adoptables'
        end
    end

    patch '/adoptables/:id' do
        if current_user.id == session[:user_id]
            @puppy = Adoptable.find(params[:id])
            @puppy.update(pet_name: params["pet_name"], pet_desc: params["pet_desc"], pet_avail: params["pet_avail"], pet_pic: params["pet_pic"])
            erb :'/adoptables/show'
        else
            redirect "/adoptables/#{params[:id]}/edit"
        end
    end

    delete '/adoptables/:id' do
        if current_user.id == session[:user_id]
            @puppy = Adoptable.all
            pet = Adoptable.find(params[:id])
            pet.destroy 
            redirect '/adoptables'
        end
    end
end