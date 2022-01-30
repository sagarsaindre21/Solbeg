# Solbeg
Prerequisites
The setups steps expect following tools installed on the system.

Github
Ruby [2.7.2]
Rails [6.0.2]
1. Check out the repository
bash git clone git@github.com:sagarsaindre21/Solbeg.git

2. Setup database.yml file
Set your postgres username and password

3. Create and setup the database
Run the following commands to create and setup the database.

ruby rake db:create rake db:migrate

4. Start the Rails server
You can start the rails server using the command given below.

ruby rails s

And now you can visit the site with the URL http://localhost:3000
