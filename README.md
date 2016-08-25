# MBTA Departure Board

Simple Phoenix Application which stores departure information in PostgreSQL and uses PubSub channels to update information in real time.

To run:
  * Phoenix assumes that our PostgreSQL database will have a postgres user account with the correct permissions and a password of "postgres".
  * mix ecto.create
  * mix ecto.migrate
  * mix run priv/repo/seeds.exs
  * mix phoenix.server

Endpoints:
  * GET /: show departure board with live updates
  * GET /origin/:origin: show departure board for particular Origin with live updates
  * GET /admin: show departure board with options to edit departures. Editing a departure should be reflected on main page immediately.



