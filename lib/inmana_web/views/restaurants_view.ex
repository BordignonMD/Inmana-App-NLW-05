defmodule InmanaWeb.RestaurantsView do
  use InmanaWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created!",
      restaurant: restaurant
    }
  end

  def render("index.json", %{restaurants: restaurants}) do
    %{data: render_many(restaurants, __MODULE__, "restaurant.json", as: :restaurant)}
  end

  def render("show.json", %{restaurant: restaurant}), do: %{restaurant: restaurant}

  def render("update.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant updated!",
      restaurant: restaurant
    }
  end

  def render("restaurant.json", %{restaurant: restaurant}) do
    %{
      id: restaurant.id,
      email: restaurant.email,
      name: restaurant.name
    }
  end
end
