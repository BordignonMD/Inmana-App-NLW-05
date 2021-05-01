defmodule Inmana.Supplies.Update do
  alias Inmana.{Repo, Supply}

  def call(%Supply{} = supply, params) do
    supply
    |> Supply.changeset(params)
    |> Repo.update()
    |> handle_update()
  end

  defp handle_update({:ok, %Supply{}} = result), do: result
  defp handle_update({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
