defmodule EventsWeb.AdminController do
  use EventsWeb, :controller

  alias Events.{Events, Rsvps}
  alias EventsWeb.ErrorHelpers

  def index(conn, _params) do
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
    message =
      case Events.update(params) do
        {:ok, _} ->
          %{
            "status" => true,
            "message" => "Event updated Successfully."
          }

        {:error, changeset} ->
          %{
            "status" => false,
            "message" => ErrorHelpers.traverse_errors(changeset)
          }
      end

    render(conn, "index.json", %{"data" => message})
  end

  def delete(conn, %{"id" => id}) do
    message =
      case Events.delete(id) do
        {:ok, _} ->
          %{
            "status" => true,
            "message" => "Event updated Successfully."
          }

        {:error, changeset} ->
          %{
            "status" => false,
            "message" => ErrorHelpers.traverse_errors(changeset)
          }
      end

    render(conn, "index.json", %{"data" => message})
  end

  def confirm_attendees(conn, %{"rsvp_id" => rsvp_id}) do
    message =
      case Rsvps.confirm(rsvp_id) do
        {:ok} ->
          %{
            "status" => true,
            "message" => "Event updated Successfully."
          }

        {:error, message} ->
          %{
            "status" => false,
            "message" => message
          }
      end

    render(conn, "index.json", %{"data" => message})
  end

  def cancel_attendees(conn, %{"rsvp_id" => rsvp_id}) do
    message =
      case Rsvps.remove(rsvp_id) do
        {:ok} ->
          %{
            "status" => true,
            "message" => "Event updated Successfully."
          }

        {:error, message} ->
          %{
            "status" => false,
            "message" => message
          }
      end

    render(conn, "index.json", %{"data" => message})
  end

  def rsvp_counts(conn, _params) do
    counts = Rsvps.counts(:rsvp)
    render(conn, "index.json", %{"data" => counts})
  end

  def rsvp_event_counts(conn, %{"event_id" => event_id}) do
    counts = Rsvps.event_counts(:rsvp, event_id)
    render(conn, "index.json", %{"data" => counts})
  end

  def cancelled_counts(conn, _params) do
    counts = Rsvps.counts(:cancel)
    render(conn, "index.json", %{"data" => counts})
  end

  def cancelled_event_counts(conn, %{"event_id" => event_id}) do
    counts = Rsvps.event_counts(:cancel, event_id)
    render(conn, "index.json", %{"data" => counts})
  end
end
