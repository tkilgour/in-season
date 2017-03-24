# In Season
In Season is an online market that connects farmers directly with new customers. It was built as a final project for Lighthouse Labs using Ruby on Rails for the back end and Materialize CSS framework for the front end.


![output_bc21uj](https://cloud.githubusercontent.com/assets/22454315/24275898/5c504eb2-1009-11e7-983b-2642863e9675.gif)


Register as a member to browse farms and markets and purchase CSA subscriptions.

Register as a farmer to create a farm profile and host your CSA signup.
Use easy inline editing when logged in. 

Add the crops you have available now, soon, and later. 
Autocomplete crops with images from over 600 crops seeded in our database, and sort automatically by harvest date.

# Setup

1. Clone this repo.
2. Run `bundle install` to install dependencies.
3. Create `config/database.yml` by copying `config/database.example.yml`.
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`.
5. Run `bin/rake db:reset` to create, load and seed db.
6. Run bin/rails s -b 0.0.0.0 to start the server.
