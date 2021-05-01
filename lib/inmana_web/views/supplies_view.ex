defmodule InmanaWeb.SuppliesView do
  use InmanaWeb, :view

  def render("create.json", %{supply: supply}) do
    %{
      message: "Supply added!",
      supply: supply
    }
  end

  def render("index.json", %{supplies: supplies}) do
    %{data: render_many(supplies, __MODULE__, "supply.json", as: :supply)}
  end

  def render("show.json", %{supply: supply}), do: %{supply: supply}

  def render("update.json", %{supply: supply}) do
    %{
      message: "Supply updated!",
      supply: supply
    }
  end

  def render("supply.json", %{supply: supply}) do
    %{
      id: supply.id,
      description: supply.description,
      responsible: supply.responsible,
      expiration_date: supply.expiration_date,
      restaurant_id: supply.restaurant_id
    }
  end
end
