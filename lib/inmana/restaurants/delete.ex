defmodule Inmana.Restaurants.Delete do
  alias Inmana.{Repo, Restaurant}

  def call(%Restaurant{} = restaurant) do
    restaurant
    |> Repo.delete()
    |> handle_delete()
  end

  defp handle_delete({:ok, %Restaurant{}} = result), do: result
  defp handle_delete({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
