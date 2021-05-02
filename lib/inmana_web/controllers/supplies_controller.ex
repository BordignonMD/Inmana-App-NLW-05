defmodule InmanaWeb.SuppliesController do
  use InmanaWeb, :controller

  alias Inmana.Supply

  alias InmanaWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Supply{} = supply} <- Inmana.create_supply(params) do
      conn
      |> put_status(:created)
      |> render("create.json", supply: supply)
    end
  end

  def delete(conn, %{"id" => uuid}) do
    with {:ok, %Supply{} = supply} <- Inmana.get_supply(uuid) do
      with {:ok, %Supply{}} <- Inmana.delete_supply(supply) do
        send_resp(conn, :no_content, "")
      end
    end
  end

  def index(conn, %{"restaurants_id" => restaurant_id}) do
    with supplies <- Inmana.index_restaurant_supplies(restaurant_id) do
      conn
      |> put_status(:ok)
      |> render("index.json", supplies: supplies)
    end
  end

  def index(conn, _params) do
    with supplies <- Inmana.index_supply() do
      conn
      |> put_status(:ok)
      |> render("index.json", supplies: supplies)
    end
  end

  def show(conn, %{"id" => uuid}) do
    with {:ok, %Supply{} = supply} <- Inmana.get_supply(uuid) do
      conn
      |> put_status(:ok)
      |> render("show.json", supply: supply)
    end
  end

  def update(conn, params) do
    with {:ok, %Supply{} = supply} <- Inmana.get_supply(params["id"]),
         {:ok, %Supply{} = supply} <-
           Inmana.update_supply(supply, %{
             description: params["description"],
             expiration_date: params["expiration_date"],
             responsible: params["responsible"]
           }) do
      conn
      |> put_status(:ok)
      |> render("update.json", supply: supply)
    end
  end
end
