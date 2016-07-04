
- Tests


- README

I have built this with a pared down version of Rails - I removed quite a few gems I didn't need for a simple app.

I tried to stick to an object oriented MVC design and keep my code neat and clean, with a separation of concerns. There is the ZendeskApi class in lib/ that deals with API calls, and then I am creating instances of the Ticket model so that it is easier to deal with and display ticket information, in a similar way that I would use Active Record models if I was saving records to a database. 

I am using the HTTParty gem to make the API calls, as it is a neater, easier way than Ruby's built in Net::HTTP class.

I have accounted for having more than 100 tickets in the Zendesk account, by making multiple API calls to get all the tickets, but only making the requests when the extra records are needed. This requires converting between my page numbers and the page numbers from the API, but is a much faster option than retrieving all records each time, which was my initial approach.

The viewer responds to the API being offline or other response errors, by displaying an error message. 

