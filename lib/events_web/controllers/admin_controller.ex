defmodule EventsWeb.AdminController do
  use EventsWeb, :controller

  alias Events.Events
  alias EventsWeb.ErrorHelpers

  def index(conn, params) do
    message = %{
      "status" => true,
      "message" => "Successfully retrieved events.",
      "data" => Events.list()
    }

    render(conn, "index.json", %{"data" => message})
  end

  def create(conn, params) do
    message =
      case Events.create(params) do
        {:ok} ->
          %{
            "status" => true,
            "message" => "Event created Successfully."
          }

        {:error, changeset} ->
          %{
            "status" => false,
            "message" => ErrorHelpers.traverse_errors(changeset)
          }
      end

    render(conn, "index.json", %{"data" => message})
  end

  def update(conn, params) do
  end

  def delete(conn, params) do
  end

  def confirm_attendees(conn, params) do
  end

  def cancel_attendees(conn, params) do
  end

  def rsvp_counts(conn, params) do
  end

  def rsvp_counts(conn, params) do
  end
end
