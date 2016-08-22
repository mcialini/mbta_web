defmodule MbtaWeb.DepartureChannel do
  require Logger
  use MbtaWeb.Web, :channel


  def join("departure:lobby", payload, socket) do
    {:ok, get_current_departure_feed(), socket}
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

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (departure:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  def broadcast_departure_feed() do
    MbtaWeb.Endpoint.broadcast("departure:lobby", "change", get_current_departure_feed())
  end

  def get_current_departure_feed() do
    query = from d in MbtaWeb.Departure,
            order_by: [asc: :scheduled_time]
    # query = from d in MbtaWeb.Departure,
    #         where: d.status != "Departed"
    departures = Repo.all(query)
    %{departures: Enum.map(departures, &MbtaWeb.DepartureChannel.departure_to_map(&1))}
  end
end
