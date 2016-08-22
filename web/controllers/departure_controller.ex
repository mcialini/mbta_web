defmodule MbtaWeb.DepartureController do
  use MbtaWeb.Web, :controller

  alias MbtaWeb.Departure

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def admin(conn, _params) do
    departures = Repo.all(Departure)
    render(conn, "admin.html", departures: departures)
  end

  def index_origin(conn, %{"origin" => origin}) do
    departures = Repo.all(from d in Departure,
                          where: d.origin == type(^origin, :string))
    render(conn, "show.html", departures: departures, origin: origin)
  end

  def new(conn, _params) do
    changeset = Departure.changeset(%Departure{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"departure" => departure_params}) do
    changeset = Departure.changeset(%Departure{}, departure_params)

    case Repo.insert(changeset) do
      {:ok, _departure} ->
        conn
        |> put_flash(:info, "Departure created successfully.")
        |> redirect(to: departure_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    departure = Repo.get!(Departure, id)
    render(conn, "show.html", departure: departure)
  end

  def edit(conn, %{"id" => id}) do
    departure = Repo.get!(Departure, id)
    changeset = Departure.changeset(departure)
    render(conn, "edit.html", departure: departure, changeset: changeset)
  end

  def update(conn, %{"id" => id, "departure" => departure_params}) do
    departure = Repo.get!(Departure, id)
    changeset = Departure.changeset(departure, departure_params)

    case Repo.update(changeset) do
      {:ok, departure} ->
        MbtaWeb.DepartureChannel.broadcast_departure_feed()

        conn
        |> put_flash(:info, "Departure updated successfully.")
        |> redirect(to: departure_path(conn, :show, departure))
      {:error, changeset} ->
        render(conn, "edit.html", departure: departure, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    departure = Repo.get!(Departure, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(departure)

    conn
    |> put_flash(:info, "Departure deleted successfully.")
    |> redirect(to: departure_path(conn, :index))
  end
end
