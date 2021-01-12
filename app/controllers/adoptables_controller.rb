class AdoptablesController < ApplicationController

    #CREATE
        #NEW 
        #make a GET request to '/adoptables/new'
        get '/adoptables/new' do
            erb :'/adoptables/new'
        end

        #CREATE
        #make a POST request to '/adoptables'
        post '/adoptables' do
           pet = Adoptable.new(params)
           if pet.save
            #take owner to adoptables index
            redirect '/adoptables'
           else
            erb :'adoptables/new'
           end
        end

    #READ
        #index
        #make a GET request to '/adoptables'

        get '/adoptables' do
            @adoptables = Adoptable.all
            erb :'adoptables/index'
        end

        #show
        #make a GET request to '/adoptables/:id'

        get '/adoptables/:id' do
            @singlepup = Adoptable.all
            @puppy = Adoptable.find{|pet| pet.pet_name}
            erb :'adoptables/show'
        end


    #UPDATE
        #edit
        #make a GET request to '/adoptables/:id/edit'

        #update
        #make a PATCH(changing one thing vs PUT changes more) request to '/adoptables/:id'

    #DESTROY
        #make a DELETE request to '/adoptables/:id'

end