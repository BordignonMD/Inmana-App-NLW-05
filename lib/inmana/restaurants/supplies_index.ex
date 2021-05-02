defmodule Inmana.Restaurants.SuppliesIndex do
  import Ecto.Query

  alias Inmana.{Repo, Supply}

  def call(restaurant_id) do
    from(Supply, where: [restaurant_id: ^restaurant_id])
    |> Repo.all()
  end
end
