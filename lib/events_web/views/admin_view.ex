defmodule EventsWeb.AdminView do
  use EventsWeb, :view

  def render("index.json", %{"data" => data}) do
    data
  end
end
