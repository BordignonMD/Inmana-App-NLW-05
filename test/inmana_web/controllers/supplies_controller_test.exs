defmodule InmanaWeb.SuppliesControllerTest do
  use InmanaWeb.ConnCase

  alias Inmana
  alias Inmana.{Restaurant, Supply}

  @restaurant_params %{
    name: "someuser",
    email: "someuser@example.com"
  }

  def fixture(:restaurant) do
    {:ok, restaurant} = Inmana.create_restaurant(@restaurant_params)
    restaurant
  end

  def fixture(:supply, id_restaurant) do
    {:ok, supply} =
      Inmana.create_supply(%{
        restaurant_id: id_restaurant,
        description: "supply_description",
        expiration_date: "2021-05-05",
        responsible: "supply_responsible"
      })

    supply
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  defp create_restaurant(_params) do
    restaurant = fixture(:restaurant)
    %{restaurant: restaurant}
  end

  defp create_supply(_params) do
    %Restaurant{id: id_restaurant} = fixture(:restaurant)

    supply = fixture(:supply, id_restaurant)
    %{supply: supply}
  end

  describe "create/2" do
    setup [:create_restaurant]

    test "when all params are valid, creates a supply", %{
      conn: conn,
      restaurant: %Restaurant{id: _id} = id_restaurant
    } do
      response =
        conn
        |> post(
          Routes.supplies_path(conn, :create, %{
            restaurant_id: id_restaurant,
            description: "supply_description",
            expiration_date: "2021-05-05",
            responsible: "supply_responsible"
          })
        )
        |> json_response(:created)

      assert %{
               "message" => "Supply added!",
               "supply" => %{
                 "description" => "supply_description",
                 "expiration_date" => "2021-05-05",
                 "id" => _id_supply,
                 "responsible" => "supply_responsible",
                 "restaurant_id" => _id_restaurant
               }
             } = response
    end

    test "when there all invalid params, returns an error", %{conn: conn} do
      response =
        conn
        |> post(
          Routes.supplies_path(conn, :create, %{
            restaurant_id: nil,
            description: nil,
            expiration_date: nil,
            responsible: nil
          })
        )
        |> json_response(:bad_request)

      assert %{
               "message" => %{
                 "description" => ["can't be blank"],
                 "expiration_date" => ["can't be blank"],
                 "responsible" => ["can't be blank"],
                 "restaurant_id" => ["can't be blank"]
               }
             } = response
    end
  end

  describe "delete/2" do
    setup [:create_supply]

    test "when the param is valid, delete the supplies", %{
      conn: conn,
      supply: %Supply{id: _id} = id_supply
    } do
      response =
        conn
        |> delete(Routes.supplies_path(conn, :delete, id_supply))

      assert response(response, 204)
    end

    test "when the params is invalid, returns an error", %{conn: conn} do
      generic_uuid = Ecto.UUID.generate()

      response =
        conn
        |> delete(Routes.supplies_path(conn, :delete, generic_uuid))
        |> json_response(:not_found)

      assert %{"message" => "Supply not found"} = response
    end
  end

  describe "index/2" do
    test "returns a list of supplies", %{conn: conn} do
      response =
        conn
        |> get(Routes.supplies_path(conn, :index))
        |> json_response(:ok)

      assert %{"data" => _data} = response
    end
  end

  describe "show/2" do
    setup [:create_supply]

    test "when the param is valid, returns a supply", %{
      conn: conn,
      supply: %Supply{id: _id} = id_supply
    } do
      response =
        conn
        |> get(Routes.supplies_path(conn, :show, id_supply))
        |> json_response(:ok)

      assert %{
               "supply" => %{
                 "description" => "supply_description",
                 "expiration_date" => "2021-05-05",
                 "id" => _id_supply,
                 "responsible" => "supply_responsible",
                 "restaurant_id" => _id_restaurant
               }
             } = response
    end

    test "when the param is invalid, returns an error", %{conn: conn} do
      generic_uuid = Ecto.UUID.generate()

      response =
        conn
        |> delete(Routes.supplies_path(conn, :delete, generic_uuid))
        |> json_response(:not_found)

      assert %{"message" => "Supply not found"} = response
    end
  end

  describe "update/2" do
    setup [:create_supply]

    test "when the params are valid, returns a message and the supply updated", %{
      conn: conn,
      supply: %Supply{id: _id} = id_supply
    } do
      response =
        conn
        |> put(Routes.supplies_path(conn, :update, id_supply), %{
          description: "other_description",
          expiration_date: "2021-05-06",
          responsible: "other_responsible"
        })
        |> json_response(:ok)

      assert %{
               "message" => "Supply updated!",
               "supply" => %{
                 "description" => "other_description",
                 "expiration_date" => "2021-05-06",
                 "id" => _id_supply,
                 "responsible" => "other_responsible",
                 "restaurant_id" => _id_restaurant
               }
             } = response
    end

    test "when the parameter id_supply is invalid, returns an error", %{
      conn: conn
    } do
      generic_uuid = Ecto.UUID.generate()

      response =
        conn
        |> put(Routes.supplies_path(conn, :update, generic_uuid), %{
          description: nil,
          expiration_date: nil,
          responsible: nil
        })
        |> json_response(:not_found)

      assert %{"message" => "Supply not found"} = response
    end

    test "when the parameters for update are invalid, returns an error", %{
      conn: conn,
      supply: %Supply{id: _id} = id_supply
    } do
      response =
        conn
        |> put(Routes.supplies_path(conn, :update, id_supply), %{
          description: nil,
          expiration_date: nil,
          responsible: nil
        })
        |> json_response(:bad_request)

      assert %{
               "message" => %{
                 "description" => ["can't be blank"],
                 "expiration_date" => ["can't be blank"],
                 "responsible" => ["can't be blank"]
               }
             } = response
    end
  end
end
