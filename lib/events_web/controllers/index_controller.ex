defmodule EventsWeb.IndexController do
  use EventsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json", %{})
  end
end
