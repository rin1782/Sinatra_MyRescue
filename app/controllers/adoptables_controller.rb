class AdoptablesController < ApplicationController

        before do
            require_login
        end

        get '/adoptables/new' do
            erb :'/adoptables/new'
        end

        post '/adoptables' do
           pet = current_user.adoptables.build(params)
           if pet.save
            redirect '/adoptables'
           else
            @error = "Data Invalid: Please enter at least a new dog's name AND description."
            erb :'adoptables/new'
           end
        end

        get '/adoptables' do
            @adoptables = Adoptable.all
            erb :'adoptables/index'
        end

        get '/adoptables/:id' do
                @puppy = Adoptable.find_by(id: params[:id])
                if @puppy
                erb :'adoptables/show'
                else
                    redirect '/adoptables'
                end
            end

        get '/adoptables/:id/edit' do
                @puppy = Adoptable.find(params[:id])
                erb :'/adoptables/edit'
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