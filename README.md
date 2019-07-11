# Stock Portfolio Tracker (Server)

[Live](https://tc-stock-app.netlify.com/)

This is an API server that allows users manage a dummy stock portfolio. It was designed following RESTful conventions and leverages the [IEX Cloud API](https://iexcloud.io/) for real stock price information. Currently, it supports user authentication, buying stocks, pricing current positions, querying past transactions and user authentication via JWTs. It was built simultaneously with a [user client](https://github.com/tchiu2/stock-portfolio-client) that handles user signup/login, placing orders and, more generally, rendering information from the API.

## Technologies and Features
The API is built using Ruby on Rails and PostgreSQL.

Some features to note:
- Authenication is handled by ```devise``` and ```devise-jwt```. The API issues users a token upon successfully login and keeps track of all valid tokens. Certain resources/endpoints require the client to send back the issued token - if an invalid token/no token is provided, the server throws an error.
- All requests to the IEX API are handled by service/module to provide more maintainable code.
- A rake script keeps the ```stocks``` table updated by fetching symbol data from IEX on a daily basis.
- The API provides consistent responses and informative error messages which makes it easier to handle responses on the frontend.

## Setup
To run the server locally:
1. Clone this repo.
2. Run ```bundle install```.
3. Setup environment variables.  
   1. Create a ```.env``` file in the root directory.
   2. Add the following keys:
      1. ```CLIENT_URL``` - points to the frontend client
      2. ```DEVISE_JWT_SECRET_KEY``` - can be generated using ```rake secret```
      3. ```IEX_TOKEN``` - register for an [IEX Cloud](https://iexcloud.io/) account and use the "publishable" key here
4. Run ```rails db:create``` - skip this step if you've already run this locally before.
5. Run ```rails db:migrate```.
6. Run ```rails s```.

You will need a frontend client to use the API, so check out the corresponding [user client](https://github.com/tchiu2/stock-portfolio-client)!
