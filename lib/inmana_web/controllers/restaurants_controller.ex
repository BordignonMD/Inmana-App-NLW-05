defmodule InmanaWeb.RestaurantsController do
  use InmanaWeb, :controller

  alias Inmana.Restaurant

  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Inmana.create_restaurant(params) do
      conn
      |> put_status(:created)
      |> render("create.json", restaurant: restaurant)
    end
  end

  def delete(conn, %{"id" => uuid}) do
    with {:ok, %Restaurant{} = restaurant} <- Inmana.get_restaurant(uuid) do
      with {:ok, %Restaurant{}} <- Inmana.delete_restaurant(restaurant) do
        send_resp(conn, :no_content, "")
      end
    end
  end

  def index(conn, _params) do
    with restaurants <- Inmana.index_restaurants() do
      conn
      |> put_status(:ok)
      |> render("index.json", restaurants: restaurants)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Restaurant{} = restaurant} <- Inmana.get_restaurant(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", restaurant: restaurant)
    end
  end

  def update(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Inmana.get_restaurant(params["id"]),
         {:ok, %Restaurant{} = restaurant} <-
           Inmana.update_restaurant(restaurant, %{name: params["name"]}) do
      conn
      |> put_status(:ok)
      |> render("update.json", restaurant: restaurant)
    end
  end
end
