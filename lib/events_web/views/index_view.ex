defmodule EventsWeb.IndexView do
  use EventsWeb, :view

  def render(conn, data) do
    %{"message" => "Events API server."}
  end
end
