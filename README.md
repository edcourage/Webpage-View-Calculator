## Webpage View Calculator

This program calculates both most viewed webpage and most uniquely viewed webpage from a web-server log.

#### Setting Up Project
 - `bundle install`

#### Running Tests

 - `rspec`
 - `rubocop`

 #### Running Program

 _This program will run using a REPL (IRB)_

  - `require "./lib/webpage_view_cal.rb"`


  ##### List most viewed pages
  - `WebpageViewCal.by_most_views(file_path: "resources/webserver.log")`

  ##### List most unique viewed pages
  - `WebpageViewCal.by_most_unique_views(file_path: "resources/webserver.log")`

  ##### List by both unique viewed and most views
  - `WebpageViewCal.list_by_both_unique_views_and_most_views(file_path: "resources/webserver.log")`


#### Challenge
1. Write a program that:
a. Receives a log file as an argument (webserver.log is provided) e.g.: ./<parse> webserver.log
b. Returns the following:
> list of webpages with most page views ordered from most pages views to less page views e.g.:
/home 90 visits /index 80 visits etc...
> list of webpages with most unique page views also ordered e.g.:
/about/2 8 unique views /index 5 unique views etc...
