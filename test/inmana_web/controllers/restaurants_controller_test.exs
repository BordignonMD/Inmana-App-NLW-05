defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase

  alias Inmana
  alias Inmana.Restaurant

  @valid_params %{
    name: "someuser",
    email: "someuser@example.com"
  }

  def fixture(:restaurant) do
    {:ok, restaurant} = Inmana.create_restaurant(@valid_params)
    restaurant
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  defp create_restaurant(_params) do
    restaurant = fixture(:restaurant)
    %{restaurant: restaurant}
  end

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, @valid_params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "someuser@example.com",
                 "id" => _id,
                 "name" => "someuser"
               }
             } = response
    end

    test "when there all invalid params, returns an error", %{conn: conn} do
      params = %{name: "Siri Cascudo"}

      expected_response = %{"message" => %{"email" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "delete/2" do
    setup [:create_restaurant]

    test "when the param is valid, delete the restaurant", %{
      conn: conn,
      restaurant: %Restaurant{id: _id} = id_restaurant
    } do
      response =
        conn
        |> delete(Routes.restaurants_path(conn, :delete, id_restaurant))

      assert response(response, 204)
    end

    test "when the params is invalid, returns an error", %{conn: conn} do
      generic_uuid = Ecto.UUID.generate()

      response =
        conn
        |> delete(Routes.restaurants_path(conn, :delete, generic_uuid))
        |> json_response(:bad_request)

      assert %{"message" => "Restaurant not found"} = response
    end
  end

  describe "index/2" do
    test "returns a list of restaurants", %{conn: conn} do
      response =
        conn
        |> get(Routes.restaurants_path(conn, :index))
        |> json_response(:ok)

      assert %{"data" => _data} = response
    end
  end

  describe "show/2" do
    setup [:create_restaurant]

    test "when the param is valid, returns a restaurant", %{
      conn: conn,
      restaurant: %Restaurant{id: _id} = id_restaurant
    } do
      response =
        conn
        |> get(Routes.restaurants_path(conn, :show, id_restaurant))
        |> json_response(:ok)

      assert %{
               "restaurant" => %{
                 "email" => "someuser@example.com",
                 "id" => _id_restaurant,
                 "name" => "someuser"
               }
             } = response
    end

    test "when the param is invalid, returns an error", %{conn: conn} do
      generic_uuid = Ecto.UUID.generate()

      response =
        conn
        |> delete(Routes.restaurants_path(conn, :delete, generic_uuid))
        |> json_response(:bad_request)

      assert %{"message" => "Restaurant not found"} = response
    end
  end

  describe "update/2" do
    setup [:create_restaurant]

    test "when the params are valid, returns a message and the restaurant updated", %{
      conn: conn,
      restaurant: %Restaurant{id: _id} = id_restaurant
    } do
      response =
        conn
        |> put(Routes.restaurants_path(conn, :update, id_restaurant), name: "otheruser")
        |> json_response(:ok)

      assert %{
               "message" => "Restaurant updated!",
               "restaurant" => %{
                 "email" => "someuser@example.com",
                 "id" => _id_restaurant,
                 "name" => "otheruser"
               }
             } = response
    end

    test "when the parameter id_restaurant is invalid, returns an error", %{
      conn: conn
    } do
      generic_uuid = Ecto.UUID.generate()

      response =
        conn
        |> put(Routes.restaurants_path(conn, :update, generic_uuid))
        |> json_response(:bad_request)

      assert %{"message" => "Restaurant not found"} = response
    end

    test "when the parameter for update is invalid, returns an error", %{
      conn: conn,
      restaurant: %Restaurant{id: _id} = id_restaurant
    } do
      response =
        conn
        |> put(Routes.restaurants_path(conn, :update, id_restaurant), %{
          name: nil
        })
        |> json_response(:bad_request)

      assert %{"message" => %{"name" => ["can't be blank"]}} = response
    end
  end
end
