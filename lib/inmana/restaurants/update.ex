defmodule Inmana.Restaurants.Update do
  alias Inmana.{Repo, Restaurant}

  def call(%Restaurant{} = restaurant, params) do
    restaurant
    |> Restaurant.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %Restaurant{}} = result), do: result
  defp handle_update({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
