class AdoptablesController < ApplicationController

        get '/adoptables/new' do
            if logged_in?
                erb :'/adoptables/new'
            else
                redirect '/login'
            end
        end

        post '/adoptables' do
           pet = current_user.adoptables.build(params)
           if !pet.pet_name.empty? && !pet.pet_desc.empty?
            pet.save
            redirect '/adoptables'
           else
            @error = "Data Invalid: Please enter at least a new dog's name AND description."
            erb :'adoptables/new'
           end
        end

        get '/adoptables' do
            if logged_in?
                @adoptables = Adoptable.all
                erb :'adoptables/index'
            else
                redirect '/login'
            end
        end

        get '/adoptables/:id' do
            if logged_in?
                @puppy = Adoptable.find_by(id: params[:id])
                if @puppy
                erb :'adoptables/show'
                else
                    redirect '/adoptables'
                end
            else
                redirect '/login'
            end
        end

        get '/adoptables/:id/edit' do
            if logged_in?
                @puppy = Adoptable.find(params[:id])
                erb :'/adoptables/edit'
            else
                redirect '/login'
            end
        end

        patch '/adoptables/:id' do
            @puppy = Adoptable.find(params[:id])
            @puppy.update(pet_name: params["pet_name"], pet_desc: params["pet_desc"], pet_avail: params["pet_avail"], pet_pic: params["pet_pic"])
            erb :'/adoptables/show'
        end

        delete '/adoptables/:id' do
            @puppy = Adoptable.all
            pet = Adoptable.find(params[:id])
            pet.destroy 
            redirect '/adoptables'
        end

end