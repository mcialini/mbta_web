defmodule MbtaWeb.DepartureController do
  use MbtaWeb.Web, :controller

  alias MbtaWeb.Departure

  def index(conn, _params) do
    departures = Repo.all(Departure)
    render(conn, "index.html", departures: departures, origin: 'all stations')
  end

  def index_origin(conn, %{"origin" => origin}) do
    departures = Repo.all(from d in Departure,
                          where: d.origin == type(^origin, :string))
    render(conn, "show.html", departures: departures, origin: origin)
  end
end
