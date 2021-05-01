# About Inmana
Inmana is an application for controlling expiration of supplies in restaurants.
Through the system it is possible to register the restaurant, the supplies used and their expiration date. Weekly, the supplies that expire during the week will be sent to the restaurant's email.

Restaurant Creation
  * POST http://localhost:4000/api/restaurants as a parameter use "name", "email"

Restaurant Delete
  * DELETE http://localhost:4000/api/restaurants/ID_RESTAURANT where "ID_RESTAURANT" is the restaurant id value.

Restaurant Index
  * GET http://localhost:4000/api/restaurants

Restaurant Show
  * GET http://localhost:4000/api/restaurants/ID_RESTAURANT where "ID_RESTAURANT" is the restaurant id value.

Restaurant Update
  * PUT http://localhost:4000/api/restaurants/ID_RESTAURANT where "ID_RESTAURANT" is the restaurant id value. As parameter use "name".

Supply Creation/Addition
  * POST http://localhost:4000/api/supplies as a parameter use "restaurant_id", "description", "expiration_date", "responsible"

Supply Delete
  * DELETE http://localhost:4000/api/supplies/ID_SUPPLY where "ID_SUPPLY" is the supply id value.

Supply Index
  * GET http://localhost:4000/api/supplies

Supply Show
  * GET http://localhost:4000/api/supplies/ID_SUPPLY where "ID_SUPPLY" is the supply id value.

Supply Update
  * PUT http://localhost:4000/api/supplies/ID_SUPPLY where "ID_SUPPLY" is the supply id value. As parameter use "description", "expiration_date", "reponsible"



## Future requirements

  * List supplies by restaurant
  * Increase test coverage

# Inmana

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Starting the project
To create a new project MIX without using HTML and CSS:

  * mix phx.new rocketpay --no-webpack --no-html

## Credo
Creating project lint file

  * mix credo gen.config

## Database
This project used the PostgreSQL database

Make sure you have installed PostgreSQL or use Docker
Access the file config/config.ex and the file config/test.ex and configure them according to your PostgreSQL installation data
Shortcut to create the bank and run migrates

mix ecto.setup
Creates the database

mix ecto.create
Delete the database

mix ecto.drop
Creates a migration

mix ecto.gen.migration create_example_table
Perform migrations

mix ecto.migrate