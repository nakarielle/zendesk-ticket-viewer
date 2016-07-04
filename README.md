##Zendesk Ticket Viewer

Code Test for Zendesk Internship

Built in Rails v4.2.6

###How to Run Locally

1. Clone or fork this repo.
2. Ensure you have at least version 2.2.2 of Ruby installed. Version can be checked by running `ruby -v` in the terminal.
3. Run `bundle` to install dependencies.
4. Run `rails s` to start the server.
5. Go to <http://localhost:3000/> in a browser to see the app.

###Testing

- In the project folder on the terminal, run `rspec` to run tests.
- These are only basic tests. I researched how to test error handling but was not able to get that working for this project.


###Design Notes

This is a pared down version of Rails - I removed files and gems I didn't need for a small app without a database. I am using the HTTParty gem to make the API calls, as it is a neater, easier way than Ruby's built in Net::HTTP class.

I tried to stick to an object oriented MVC design and keep my code neat and clean, with a separation of concerns. There is the ZendeskApi class to deal with the API calls, which is in a lib/ folder as it is not a model. The Ticket model is used to create instances based on data received from the API, which can then be used to display ticket information, in a similar way that I would use Active Record models if I was saving records to a database. 

The Zendesk API returns 100 tickets per page - I have accounted for having more tickets than this by making multiple API calls, but only making the requests when the extra records are needed. This requires converting between my page numbers and the page numbers from the API, but is a much faster option than retrieving all records each time, which was my initial approach.

The viewer responds to the API being offline or other response errors, by displaying an error message. 
