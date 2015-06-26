# Database Optimizations

## Description

Given an existing application which generates a report from a large data set, improve the efficiency of the report using database optimization methods.

## Normal Mode

For this project, you will be starting with an application which runs very slowly.  This ineffiency is due partly to the sheer amount of data present, but mostly due to the structure of the code and the database.  Your task is to make it run in a reasonable amount of time.

Once you pull down the application from GitHub, run `bundle install` and `rake db:migrate`, then follow the steps below.

* Run `rake db:seed`, but time it.  Record the amount of time it takes for the seeds to run.
  * **`4660.915127 seconds (78 minutes)`**
* Turn on your server and open your browser.
* Open Chrome's timeline in developer tools, then go to `localhost:3000`.
* Determine how long it takes the index page to load.  Record that time.
  * `2:30`
* Add appropriate indices to the data structure (via migrations).
* Record how long it takes to run the migrations that add indices.
  * `== 20150622195622 AddIndices: migrated (6.7495s) ==`
* Use Chrome's developer tools to determine how long it takes the index page to load.  Record that time.
  * `4.6, 3.66, 4.16 seconds. Avg: 4.14 seconds`
* Calculate your percent improvement in runtime.
  * `97.24% faster than previous`
* Examine the code that is run when the root path loads.  Modify the commands which access the database to make them more efficient.
* Calculate your percent improvement in runtime.
  * 1428.0 ms, 1401.0 ms, 1462.5 ms. Avg: 1431 ms. 65.4% faster than previous. 99% faster than original
* Once you have optimized your code as much as you think you can, drop the database, run `rake db:migrate`, and then time how long it takes to run `rake db:seed`.  Was there an improvement or a worsening of runtime?  By what percent and why?
  * `3289.962165 seconds (54.8 minutes).`
* Which is faster: (a) running `rake db:seed` without indices and then running a migration to add indices, or (b) adding indices during your initial `rake db:migrate`, then running `rake db:seed`?
  * adding indices and then seeding.

You've done a good job of analyzing runtime, but now take a look at storage space:

* Record the size of your database (in bytes).
  * `572,145,664 bytes`
* Record the size of your development log.
  * `1,470,770,062 bytes`
* Give at least one method (feel free to Google) for reducing the size of one of these, yet keeping your data intact.
  * `vacuum`
* Do you think that this is smaller, about right, or larger than the size of databases you'll be working with in your career?
  * `larger`
