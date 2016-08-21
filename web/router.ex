defmodule MbtaWeb.Router do
  use MbtaWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MbtaWeb do
    pipe_through :browser # Use the default browser stack

    get "/", DepartureController, :index
    get "/origin/:origin", DepartureController, :index_origin
  end

  # Other scopes may use custom stacks.
  # scope "/api", MbtaWeb do
  #   pipe_through :api
  # end
end
