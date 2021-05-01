defmodule Inmana.Supplies.Delete do
  alias Inmana.{Repo, Supply}

  def call(%Supply{} = supply) do
    supply
    |> Repo.delete()
    |> handle_delete()
  end

  defp handle_delete({:ok, %Supply{}} = result), do: result
  defp handle_delete({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
