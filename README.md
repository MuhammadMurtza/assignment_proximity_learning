
#  Proximity  Learning  Assignment
##  Contents
-  [Assumptions](#assumptions)

-  [Dependencies](#dependencies)

-  [Project  Setup](#project-setup)
##  Assumptions
- Ensure that MySql is setup properly.
- Ensure that the User table is empty .
##  Dependencies
-  Ruby 3.1.3
-  Bundler v2.3.26
-  Ruby on Rails  7.0.4.2
-  MySQL 5.7+
##  Project  Setup
1.  Clone  this  git  repository:
```bash
git clone repo
cd project
```
2.  Install  the  required  gems:
```bash
bundle install
```
3.  Create  an  `enviroment_variables.yml`  file  by  copying  the  example  database  configuration:
```bash
touch config/enviroment_variables.yml
```
4.  Add your database configuration details to `enviroment_variables.yml`

   Example:
```bash
DATABASE_NAME: "assignment_proximity_learning_development"
DATABASE_USERNAME: ""
DATABASE_PASSWORD: ""
```
5.  Create  and  populate the database  with  seeds,seeding database will only allow to edit as data will already be there.Do not seed if you want to add new data.
```
rails db:create
rails db:migrate
rake db:seed
```
6. Install node modules
```bash
npm i
```
7.  Run  server:
```bash
rails server
```
8.  Run Rspec tests:
```bash
rspec
```

