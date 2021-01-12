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

        
<form action="/adoptables/<%= @puppy.id %>" method="post">
    <input type="hidden" name="_method" value="delete">
    <button type="submit">Delete Pup</button>
</form>

