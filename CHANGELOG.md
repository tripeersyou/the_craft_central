# The Craft Central Integrated Consignment System
## Developed by: R-Factor Solutions
### MIS 121/122 Academic Year 2017 - 2018

**The Team:**

* Laura Denise Ang - Project Manager
* Francis Oliver Avanceña - Lead Developer
* Lance Derek Andallaza - Quality Assurance
* Wesley Aaron Cua - Systems Analyst

--- 

## Changelog and Development Log
* May 10, 2018
    * Fixed a bug in the transfer#create.
* May 9, 2018
    * Added more test scripts in delivery
* May 6, 2018
    * Bug fixes and more polishing
    * Added a bunch of notices when resources are created/edited.
    * Polished the front-end especially the dashboard for performance.
* May 5, 2018
    * Started adding test specs for 7 models
* May 4, 2018
    * Added the import function for the products
    * Bug fixes
* May 1, 2018
    * Finished all the templates for the `.xls.erb` files
* April 30, 2018
    * Added the search functionality for `stores/index.html.erb` and `products/index.html.erb`
    * `TransfersController` bug fixes.
    * Added the xlsx for stores and products to the seeds.rb
* April 27, 2018
    * Edited `_form.html.erb` for the edit page.
    * Completed server-side validation.
    * Added the `roo` gem.
* April 26, 2018
    * Created the `structure.sql` for each DBMS.
    * Created `production_setup.sh` shell script.
* April 23, 2018
    * Added back-end validation for a ton of models.
* April 18, 2018
    * Revamped the database and fixed all code regarding `beginning_inventory_products`
    * Generated `ApiController`
    * Finished the screens
* April 17, 2018
    * Generated `rspec-rails` helper files
* April 16, 2018
    * Added functionality for `forms#index`
    * Added `forms/index.html.erb` index code.
* April 13, 2018
    * Created the `FormsController`
    * Added routes for forms page
* March 30, 2018
    * Added the `.xls.erb` template files
    * Edited the ending_inventory.rb file
    * Updated Rails version from `5.1.5` to `5.1.6`
* March 15, 2018
    * Edited the stores/show to reflect transfers. 
    * Created `show.html.erb` for deliveries, pullouts, orders, ending inventories and transfers
* March 13, 2018
    * Created supplier module and order module
* March 7, 2018
    * Updated Rails version from `5.1.4` to `5.1.5`
    * Edited `stores/index`
    * Added another instance model for Store
    * Added the query string parameters for the dashboard chart
* March 4, 2018
    * Added `cogs` ands `sales` column for the ending inventories
    * Created graphs for the dashboard
    * Added `chartkick` and `groupdate` gems
* Feb 27, 2018
    * More front end
    * Refactored the `create` in `DeliveriesController` and `PulloutsController`
* Feb 26, 2018
    * More front-end stuff in `/stores/:id`
    * Created `StaffsController` and added functionality
    * Finished Ending Inventory functionality
    * Created 'EndingInventoriesController'
* Feb 21, 2018
    * Finished Pullout functionality
    * Created `PulloutsController`
* Feb 20, 2018
    * Finished Delivery functionality
* Feb 18, 2018
    * Created `DeliveriesController`
    * Finished Stores CRUD
    * Finished Products CRUD
* Feb 16, 2018
    * Edited migration for products table
    * Created `products/index.html.erb`
* Feb 14, 2018
    * Created `manage_accounts/index.html.erb`
    * Created `ManageAccountsController` and created `index` method.
    * Changed Products icon
    * Created `ProductsController` and methods
    * Changed the server time to local time.
* Feb 13, 2018
    * Added active icon and text to dashboard at the sidebar
    * Added to `:status` to Admin
    * Added `:first_name` and `:last_name` to permitted parameters
    * Created dashboard page
    * Added the account page and edit account page
    * Added assets for sidebar icons and the font
    * Created Navbar and Sidebars
    * Created `PagesController` and dashboard
    * Added default Admin and Staff accounts to `seeds.rb`
    * Added the gems `will_paginate` and `will_paginate_semantic_ui`
* Feb 12, 2018
    * Regerenerated Rails ERD
    * Added model relationships
    * Added xls to mime types
    * Created all models
    * Edited Login/Sign-up pages
    * Edited README.md
* Feb 11, 2018
    * Added `router-visualizer` to the Gemfile.
        * To look at router visualization: [http://localhost:3000/routes](http://localhost:3000/routes)
    * Edited the application routes
    * Removed Pages controller
* Feb 9, 2018
    * Created Pages controller
    * Generated ERD with `rails-erd`
    * Authentication with `Devise` has been setup
        * Admin model with Views
        * Staff model with Views
    * The following gems have been installed.
        * `jquery-rails`
        * `rails-erd`
        * `cocoon`
        * `devise`
        * `semantic-ui-sass`
        * `simple_form`
        * `rspec-rails`
    * Created the application.