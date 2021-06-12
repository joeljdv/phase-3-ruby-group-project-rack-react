# phase-3-ruby-group-project-rack-react

This is a backend with a SQlite database of movie directors and their movies. To have access to this backend fork this repo and clone it on your computer. You will see a README file, and a folder called backend, inside this folder you will find an app folder, a db folder, a config folder, a Gemfile, and a Rakefile.

In the app folder you will find an application file where we deal with HTTP request and response. You will also find a director and a movie files, with the use of ActiveRecord these two files create the objects that will populate the SQlite database. The director file creates a director and adds it to the directors table and the movie file creates a movie and associates that movie to a director.

In the db folder you can find a migrate folder where there are two migrations, one creates the directors table and the other one creates the movies table. You will also the schema file where you can see the schema of both tables.

In the Gemfile you find all the necessary gems to run this repo.

Once you have cloned this repo, in your terminal run 'bundle install' to install all the gems and then 'shotgun --port== 9292', this will run your server on the port  http://localhost:9292.

The frontend of this repo can be found on https://github.com/joeljdv/ruby-project-frontend. Fork that repo and clone it on your computer and follow the steps on the README file to run it.



