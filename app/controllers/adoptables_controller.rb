class AdoptablesController < ApplicationController

    #CREATE
        #NEW 
        #make a GET request to '/adoptables/new'

        #CREATE
        #make a POST request to '/adoptables'

    #READ
        #index
        #make a GET request to '/adoptables'

        get '/adoptables' do
            @adoptables = Adoptable.all
            erb :'adoptables/index'
        end

        #show
        #make a GET request to '/adoptbales/:id'

    #UPDATE
        #edit
        #make a GET request to '/adoptables/:id/edit'

        #update
        #make a PATCH(changing one thing vs PUT changes more) request to '/adoptables/:id'

    #DESTROY
        #make a DELETE request to '/adoptables/:id'

end