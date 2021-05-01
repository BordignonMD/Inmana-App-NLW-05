defmodule Inmana do
  alias Inmana.Restaurants.Create, as: RestaurantCreate
  alias Inmana.Restaurants.Delete, as: RestaurantDelete
  alias Inmana.Restaurants.Get, as: RestaurantGet
  alias Inmana.Restaurants.Index, as: RestaurantIndex
  alias Inmana.Restaurants.Update, as: RestaurantUpdate

  alias Inmana.Supplies.Create, as: SupplyCreate
  alias Inmana.Supplies.Delete, as: SupplyDelete
  alias Inmana.Supplies.Get, as: SupplyGet
  alias Inmana.Supplies.Index, as: SupplyIndex
  alias Inmana.Supplies.Update, as: SupplyUpdate

  defdelegate create_restaurant(params), to: RestaurantCreate, as: :call
  defdelegate delete_restaurant(id_restaurant), to: RestaurantDelete, as: :call
  defdelegate get_restaurant(id_restaurant), to: RestaurantGet, as: :call
  defdelegate index_restaurants(), to: RestaurantIndex, as: :call
  defdelegate update_restaurant(restaurant, params), to: RestaurantUpdate, as: :call

  defdelegate create_supply(params), to: SupplyCreate, as: :call
  defdelegate delete_supply(id_supply), to: SupplyDelete, as: :call
  defdelegate get_supply(id_supply), to: SupplyGet, as: :call
  defdelegate index_supply(), to: SupplyIndex, as: :call
  defdelegate update_supply(supply, params), to: SupplyUpdate, as: :call
end
