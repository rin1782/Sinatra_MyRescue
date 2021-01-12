class AdoptablesController < ApplicationController

        get '/adoptables/new' do
            erb :'/adoptables/new'
        end

        post '/adoptables' do
           pet = Adoptable.new(params)
           if !pet.pet_name.empty? && !pet.pet_desc.empty?
            pet.save
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
            @puppy = Adoptable.find(params[:id])
            erb :'adoptables/show'
        end

        get '/adoptables/:id/edit' do
            @puppy = Adoptable.find(params[:id])
            erb :'/adoptables/edit'
        end

        patch '/adoptables/:id' do
           
        end

        delete '/adoptables/:id' do
            pet = Adoptable.find(params[:id])
            pet.destroy 
            redirect '/adoptables'
        end

end