class AdoptablesController < ApplicationController


        get '/adoptables/new' do
            if logged_in?
            erb :'/adoptables/new'
            end
        end

        post '/adoptables' do
           pet = Adoptable.new(params)
           pet.owner_id = session[:user_id]
           if pet.save
            redirect '/adoptables'
           else
            @error = "Data Invalid: Please enter at least a new dog's name AND description."
            erb :'adoptables/new'
           end
        end

        get '/adoptables' do
            if logged_in?
            @adoptables = Adoptable.all.reverse
            erb :'adoptables/index'
            end
        end

        get '/adoptables/:id' do
                if logged_in?
                @puppy = Adoptable.find_by(id: params[:id])
                @user = current_user
                if @puppy
                erb :'adoptables/show'
                else
                    redirect '/adoptables'
                end
            end
            end

        get '/adoptables/:id/edit' do
            if logged_in?
                @puppy = Adoptable.find(params[:id])
               
                @user = current_user
                erb :'/adoptables/edit'
            end
        end

        patch '/adoptables/:id' do
            if current_user.id == session[:user_id]
            @puppy = Adoptable.find(params[:id])
            @puppy.update(pet_name: params["pet_name"], pet_desc: params["pet_desc"], pet_avail: params["pet_avail"], pet_pic: params["pet_pic"])
            erb :'/adoptables/show'
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