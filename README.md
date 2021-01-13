*Create Migrations
        -rake db:migrate
        create rake tasks
        
*create multiple models that include has_many and belongs_to relationships


*plan multiple routes for controller following restful conventions


#CRUD
        #NEW 
        #make a GET request to '/adoptables/new'
        #CREATE
        #make a POST request to '/adoptables'

        #READ
        #index
        #make a GET request to '/adoptables'

        #update
        #make a PATCH(changing one thing vs PUT changes more) request to '/adoptables/:id'

        #DESTROY
        #make a DELETE request to '/adoptables/:id'

*create a user login/password page
*build forms
*build navigation
*add user authentication
*add user authorization
*don't want a user who's not logged in to see certain data

        



#make an if statement after every get to make sure theyre logged in

  <div><a href="/adoptables/<%= @puppy.id %>/edit">Pupdate</a></div>

 