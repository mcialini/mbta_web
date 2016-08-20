defmodule MbtaWeb.DepartureControllerTest do
  use MbtaWeb.ConnCase

  alias MbtaWeb.Departure
  @valid_attrs %{destination: "some content", lateness: 42, origin: "some content", scheduled_time: 42, status: "some content", timestamp: 42, track: "some content", trip: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, departure_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing departures"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, departure_path(conn, :new)
    assert html_response(conn, 200) =~ "New departure"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, departure_path(conn, :create), departure: @valid_attrs
    assert redirected_to(conn) == departure_path(conn, :index)
    assert Repo.get_by(Departure, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, departure_path(conn, :create), departure: @invalid_attrs
    assert html_response(conn, 200) =~ "New departure"
  end

  test "shows chosen resource", %{conn: conn} do
    departure = Repo.insert! %Departure{}
    conn = get conn, departure_path(conn, :show, departure)
    assert html_response(conn, 200) =~ "Show departure"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, departure_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    departure = Repo.insert! %Departure{}
    conn = get conn, departure_path(conn, :edit, departure)
    assert html_response(conn, 200) =~ "Edit departure"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    departure = Repo.insert! %Departure{}
    conn = put conn, departure_path(conn, :update, departure), departure: @valid_attrs
    assert redirected_to(conn) == departure_path(conn, :show, departure)
    assert Repo.get_by(Departure, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    departure = Repo.insert! %Departure{}
    conn = put conn, departure_path(conn, :update, departure), departure: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit departure"
  end

  test "deletes chosen resource", %{conn: conn} do
    departure = Repo.insert! %Departure{}
    conn = delete conn, departure_path(conn, :delete, departure)
    assert redirected_to(conn) == departure_path(conn, :index)
    refute Repo.get(Departure, departure.id)
  end
end
