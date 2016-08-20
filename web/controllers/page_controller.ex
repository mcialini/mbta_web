defmodule MbtaWeb.PageController do
  use MbtaWeb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
