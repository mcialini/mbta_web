defmodule MbtaWeb.DepartureTest do
  use MbtaWeb.ModelCase

  alias MbtaWeb.Departure

  @valid_attrs %{destination: "some content", lateness: 42, origin: "some content", scheduled_time: 42, status: "some content", timestamp: 42, track: "some content", trip: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Departure.changeset(%Departure{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Departure.changeset(%Departure{}, @invalid_attrs)
    refute changeset.valid?
  end
end
