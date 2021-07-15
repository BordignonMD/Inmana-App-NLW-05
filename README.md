# About Inmana
Inmana is an application for controlling expiration of supplies in restaurants.
Through the system it is possible to register the restaurant, the supplies used and their expiration date. Weekly, the supplies that expire during the week will be sent to the restaurant's email.

  * [Technologies](#Technologies)
  * [Installation](#Installation)
  * [Requirements](#Requirements)
  * [Phoenix references](#Phoenix-references)
  * [Support](#Support)

# Technologies

This project was developed with the following technologies:

  * [Elixir](https://elixir-lang.org/)
  * [Phoenix](https://phoenixframework.org/)
  * [PostgreSQL](https://www.postgresql.org/)

## Installation

1. Clone this repository

```
git clone https://github.com/BordignonMD/Inmana-App-NLW-05.git
```

2. Change directory location

```
cd /path/to/inmana-app-nlw-05
```

3. Install and compile dependencies

```
mix do deps.get, deps.compile
```

4. Create, migrate, and seed the database

```
mix ecto.create
mix ecto.migrate
mix ecto.seed
```

5. Start the server

```
mix phx.server
```

## Requirements

Restaurant Creation
  * POST http://localhost:4000/api/restaurants as a parameter use "name", "email".

Restaurant Delete
  * DELETE http://localhost:4000/api/restaurants/ID_RESTAURANT where "ID_RESTAURANT" is the restaurant id value.

Restaurant Index
  * GET http://localhost:4000/api/restaurants

Restaurant Show
  * GET http://localhost:4000/api/restaurants/ID_RESTAURANT where "ID_RESTAURANT" is the restaurant id value.

Restaurant Update
  * PUT http://localhost:4000/api/restaurants/ID_RESTAURANT where "ID_RESTAURANT" is the restaurant id value. As parameter use "name".

Supply Creation/Addition
  * POST http://localhost:4000/api/supplies as a parameter use "restaurant_id", "description", "expiration_date", "responsible".

Supply Delete
  * DELETE http://localhost:4000/api/supplies/ID_SUPPLY where "ID_SUPPLY" is the supply id value.

Supply Index
  * GET http://localhost:4000/api/supplies

Supply Show
  * GET http://localhost:4000/api/supplies/ID_SUPPLY where "ID_SUPPLY" is the supply id value.

Supply Update
  * PUT http://localhost:4000/api/supplies/ID_SUPPLY where "ID_SUPPLY" is the supply id value. As parameter use "description", "expiration_date", "reponsible".

Supply Index for Restaurant
  * GET http://localhost:4000/api/restaurant/ID_RESTAURANT/supplies WHERE "ID_RESTAURANT" is the restaurant id value.

## Future requirements

  * Increase test coverage

## Phoenix references

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Support

Bug reports and feature requests can be filed with the rest for the Phoenix project here:

  * [File Bug Reports and Features](https://github.com/BordignonMD/Inmana-App-NLW-05/issues)
