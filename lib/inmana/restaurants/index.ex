defmodule Inmana.Restaurants.Index do
  alias Inmana.{Repo, Restaurant}

  def call do
    Repo.all(Restaurant)
  end
end
