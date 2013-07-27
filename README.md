# Ruby on Rails 4 Live Streaming Example

Small example (I used `rails g scaffold`) which shows the live streaming
capabilities of Rails 4 using **ActionController::Live** and a client-side JavaScript
that handles the __refresh__ event that is added in the response of the server.

I used [puma](http://puma.io/) to test live streaming, [because as it seems](http://tenderlovemaking.com/2012/07/30/is-it-live.html) WEBrick won't work.

Because this app is supposed to be a small example, it only watches if the SCSS-file in the _app/assets/stylesheets/users.css.scc__ has been modified. 

***
In order to see live streaming in action, start puma, visit _localhost:9292/users_,
change some attributes of any element in the SCSS-file (e.g. `h1 { color: red; } `),
and see the magic of live streaming at work.

**Thanks to Aaron Patterson for his great [article](http://tenderlovemaking.com/2012/07/30/is-it-live.html)**