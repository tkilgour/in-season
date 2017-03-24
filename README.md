# In Season
In Season is an online market that connects farmers directly with new customers. It was built as a final project for Lighthouse Labs using Ruby on Rails for the back end and Materialize CSS framework for the front end.


![output_bc21uj](https://cloud.githubusercontent.com/assets/22454315/24275898/5c504eb2-1009-11e7-983b-2642863e9675.gif)



Register as a member to browse farms and markets and purchase CSA subscriptions.


![output_vaed3f](https://cloud.githubusercontent.com/assets/22454315/24276601/344d3768-100e-11e7-8b35-2842fb8092ad.gif)




Register as a farmer to create a farm profile and host your CSA signup.
Use easy inline editing when logged in. 


![output_9myi28](https://cloud.githubusercontent.com/assets/22454315/24275705/be78850c-1007-11e7-994e-fe825f88b912.gif)





Add the crops you have available now, soon, and later. 
Autocomplete crops with images from over 600 crops seeded in our database, and sort automatically by harvest date.


![output_0yzhsi](https://cloud.githubusercontent.com/assets/22454315/24275603/014df412-1007-11e7-9be0-44e4d20411d5.gif)


# Setup

1. Clone this repo.
2. Run `bundle install` to install dependencies.
3. Create `config/database.yml` by copying `config/database.example.yml`.
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`.
5. Run `bin/rake db:reset` to create, load and seed db.
6. Run bin/rails s -b 0.0.0.0 to start the server.
