# README

## MySMS

This application is used for sending SMS messages using the twilio API. Currently it can only send messages to the default twilio number +18777804236. 

Upon signing up or logging in with your email and password you will be brought to the messages screen.

Once you are at the messages screen you will see a form to create a message. 

Creating a message sends the message through the Twilio API and if successful adds the record to the database. 

The message is then added to the message history and if it is delivered the application updates the frontend through the use of webhooks and a websocket.