# Architecture
This solution consists of 2 projects residing at 2 respective directories:
 - product-inventory-api: A HTTP Api built with Ruby on Rails, using Rails' migration to load data in .csv files into a sqlite3 database. It runs at port 3000. 
    - I used Rails' migration to generate Active Record models ("app/models/") and database tables ("db/development.sqlite3")
    - Data files(.csv) are being stored at "db/data/"; I used seeds ("db/seeds.rb") to populate data from .csv files to database tables. Use command "rake db:seed" will delete all data in database and re-populate them from .csv files.
    - API methods are defined at ProductsController and InventoriesController ("app/controllers/"). API routes are defined at "config/routes.rb". The API method index at InventoriesController wasn't called by webui project since the ProductsController index method eager-loaded inventory data for each product to avoid separate API calls. 

 - product-inventory-webui: A simple web site built with React to display product inventory data retrived from API calls. It runs at port 3001.
    - I used React components to display results from API calls because it is easy to use and quick to putting on a page.

 # Prerequisites
 - For API project, install latest versions of Ruby then Rails.
 - For WebUI project, install latest versions of NodeJS and NPM. 

 # Build Instructions
 - API project: in the project directory, type "bundle install" to make sure all project dependencies are updated or installed; then type "rails server" to build the project. The project will be listening on port 3000 after it is built sucessfully. Test the API by going to http://localhost:3000/products. 

 - WebUI project: Make sure API project is running then in theproject directory, type "npm install" to install required project dependencies. Then type "npm start". The web site will be displayed at http://localhost:3001/

 # Future Improvements 
  - Implement filtering and sorting on product inventories on the web page.
  - Data validation and error handling for the csv data import. Better data-mapping(By using Hash) when inserting data from csv files to database.
  - Normalize database table "product_inventories" to remove redundant data at "style" column.
  - Implement full CRUD operations at both API and WebUI projects.
  - Add unit tests on both projects.