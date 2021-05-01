defmodule Inmana.Supplies.Index do
  alias Inmana.{Repo, Supply}

  def call do
    Repo.all(Supply)
  end
end
