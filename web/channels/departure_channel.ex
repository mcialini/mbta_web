defmodule MbtaWeb.DepartureChannel do
  require Logger
  use MbtaWeb.Web, :channel


  def join("departure:lobby", payload, socket) do
    Logger.debug "joined lobby"
    {:ok, get_current_departure_feed(), socket}
  end

  def join("departure:" <> origin, _params, socket) do
    Logger.debug "joined origin"
    {:ok, get_current_departure_feed(%{:origin => origin}), socket}
  end

  def broadcast_departure_feeds(origin) do
    Logger.debug "broadcasting on feed"
    MbtaWeb.Endpoint.broadcast("departure:lobby", "change", get_current_departure_feed())
    Logger.debug "broadcasting on feeds #{origin}"
    MbtaWeb.Endpoint.broadcast("departure:#{origin}", "change", get_current_departure_feed(%{:origin => origin}))
  end

  def get_current_departure_feed() do
    query = from d in MbtaWeb.Departure,
            order_by: [asc: :scheduled_time]
    # query = from d in MbtaWeb.Departure,
    #         where: d.status != "Departed"
    departures = Repo.all(query)
    %{departures: Enum.map(departures, &MbtaWeb.DepartureChannel.departure_to_map(&1))}
  end
  
  def get_current_departure_feed(params) do
    query = from d in MbtaWeb.Departure,
            where: d.origin == ^params[:origin],
            order_by: [asc: :scheduled_time]
    # query = from d in MbtaWeb.Departure,
    #         where: d.status != "Departed"
    departures = Repo.all(query)
    %{departures: Enum.map(departures, &MbtaWeb.DepartureChannel.departure_to_map(&1))}
  end

  def departure_to_map(departure) do
    %{
      "timestamp" => departure.timestamp,
      "origin" => departure.origin,
      "trip" => departure.trip,
      "destination" => departure.destination,
      "scheduled_time" => departure.scheduled_time,
      "lateness" => departure.lateness,
      "track" => departure.track,
      "status" => departure.status
    } 
  end
end
