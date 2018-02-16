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