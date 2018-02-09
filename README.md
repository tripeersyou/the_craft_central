# The Craft Central Integrated Consignment System
## Developed by: R-Factor Solutions
### MIS 121/122 Academic Year 2017 - 2018
**The Team:**
* Laura Denise Ang - Project Manager
* Francis Oliver Avanceña - Lead Developer
* Lance Derek Andallaza - Quality Assurance
* Wesley Aaron Cua - Systems Analyst
---
## Contents
<ul>
    <li>
        <h4><a href="#dependencies">Dependencies</a></h4>
        <ul>
            <li><a href="#ruby-v">Ruby Version</a></li>
            <li><a href="#rails-v">Rails Version</a></li>
            <li><a href="#rails-erd">Optional: Rails ERD</a></li>
        </ul>
    </li>
    <li>
        <h4><a href="#setting-up">Setting up the development environment</a></h4>
    </li>
    <li>
        <h4><a href="#running-tests">Running Tests</a></h4>
    </li>
    <li>
        <h4><a href="#running-production">Running in Production</a></h4>
    </li>
    <li>
        <h4><a href="#change-adapter">Changing the database adapter</h4>
        <ul>
            <li><a href="#postgres">PostgreSQL</a></li>
            <li><a href="#mysql">MySQL</a></li>
        </ul>
    </li>
    <li>
        <h4><a href="#git">Git and others . . .</a></h4>
    </li>
</ul>

---
<h2 id="dependencies">Dependencies</h2>

<h3 id="ruby-v">Ruby Version: 2.2 up and Rails 5.4</h3>

### Instructions for:

#### [Windows](https://gorails.com/setup/windows/10)
#### [Mac OS X](https://gorails.com/setup/osx/10.12-sierra)
- Follow guide until `sqlite3`

Checking your version:
```
$ ruby -v
=> ruby-2.2
```
<h3 id="rails-v">Rails Version: 5.1.4</h3>
Updating Rails version

Run the following in the terminal:
```
$ gem install bundler --pre
$ gem install rails
```
If there is an authorization error add `sudo` before the command.


Checking your version:
```
$ rails -v
=> Rails 5.1.4
```
<h3 id="rails-erd">Optional: Rails-ERD</h3>

* Install [`Graphviz`](http://graphviz.org/Download..php)s
* Add `Graphviz` bin to the `$PATH` environment variable.
* Restart all instances of the terminal.
* Check if `Graphviz` is installed.
```
$ dot -V
=> dot - graphviz version 2.38.0
```
* Generating the ERD.
```
$ rails erd
```
---
<h2 id="setting-up">Setting up the development environment</h2>

* Clone/download the repository.
* Open the `Gemfile` and change the adapter of the database to your own choosing `sqlite3` is the default.
* Open the terminal inside the root directory of the project.
* Run the following command:
```
$ cp config/database.yml.dist config/database.yml
$ cp config/secrets.yml.dist config/secrets.yml
```
* Edit the contents of `config/database.yml` and add the your database credentials. If you are using `sqlite3` don't edit the file.
* In the terminal run the following commands
```
$ bundle install

$ rails db:drop:_unsafe db:create db:migrate db:seed
```
* Start your database service, if database adapter is not `sqlite3`.
* Run `rails server` in the terminal. In your browser go to http://localhost:3000.
---
<h2 id="running-tests">Running tests</h2>

Using the RSpec Gem
* Create a  database in the `test` environment
```
$ rails db:drop:_unsafe db:create db:migrate RAILS_ENV=test
```
* Running the test specs:
```
$ bundle exec rspec --format documentation
```
---
<h2 id="running-production">Running in the production environment</h2>

* Uncomment the Devise secret key on `config/intializers/devise.rb`.
* In `production.rb` edit the following line.
```ruby
# false by default
 config.assets.compile = true 
```
* Precompile and clean the Asset Pipeline
    * Needs to be re-run every time a `font`, `.scss`, `.css`, `.coffee`, `.js`, or an `image` is added or modified in the `app/assets`, `lib/assets` and `vendor/assets` folders.
```
$ rails assets:precompile RAILS_ENV=production

$ rails assets:clean RAILS_ENV=production
```
* Generate the secret key for the Rails Application
```
$ rails secret
```
* Copy the generated secret key to `config/secrets.yml` in the production environment secret base key.
* Setup the production database
```
$ rails db:drop:_unsafe db:create db:migrate db:seed RAILS_ENV=production
```
* Run the server in production environment. http://localhost:3000.
```
$ rails server --environment=production
```
---
<h2 id="change-adapter">Changing the database adapter</h2>

<h3 id="postgres">PostgreSQL</h3>

* Download PostgreSQL for their [website](https://www.postgresql.org/download/) with pgAdmin.
* Take note of the user name and password during the installation.
* Check installation of PostgreSQL.
```
$ psql -V
=> psql (PostgreSQL) 10.0
```
* In the `Gemfile` change the `sqlite3` gem with `pg`.
* Run `bundle install`.
* Edit the contents of `config/database.yml`. Add the following fields in the `default`.
```yaml
default: &default
  adapter: postgresql
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: username
  passoword: password
  timeout: 5000

development/test/development:
  <<: *default
  database: database_name
#   Preferred to have different names for each application environment
```
* Run PostgreSQL using pgAdmin.
* Create and migrate the database
```
$ rails db:create db:migrate db:seed
```
<h3 id="mysql">MySQL</h3>

* Download XAMPP of the Apache Friends [website](https://www.apachefriends.org/download.html).
* Open XAMPP Control Panel and start Apache Web Server and MySQL.
    * The default username for the database is `root` and has no password. 
    * You should be able to access the GUI version of MySQL in phpMyAdmin: http://localhost/phpmyadmin/.
* In the `Gemfile` change the `sqlite3` gem with `mysql2`.
* Run `bundle install`.
* Edit the contents of `config/database.yml`. Add the following fields in the `default`.
```yaml
default: &default
  adapter: mysql2
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  passoword: 
  timeout: 5000

development/test/development:
  <<: *default
  database: database_name
  # Preferred to have different names for each application environment
```
* Make sure Apache Web Server and MySQL is running.
* Create and migrate the database.
```
$ rails db:create db:migrate db:seed
```
---
<h2 id="git">Git and others . . .</h2>

### Installing Git

Install git in your workstation from the [git website](https://git-scm.com/downloads).

To check if your installation is working open your terminal and type `git`.

### SourceTree

For better management you can opt to download [SourceTree](https://www.sourcetreeapp.com/).

### Changelogs

For development changelogs regarding the project check the CHANGELOG.md file.

---