defmodule EventsWeb.UserController do
  use EventsWeb, :controller

  alias Events.Rsvps
  alias EventsWeb.ErrorHelpers

  def index(conn, %{"email" => email}) do
    data = Rsvps.my_events(email)
    render(conn, "index.json", %{"data" => data})
  end

  def attend(conn, params) do
    message =
      case Rsvps.add(params) do
        {:ok, _} ->
          %{
            "status" => true,
            "message" => "Successfully added event to your calendar."
          }

        {:error, changeset} ->
          %{
            "status" => false,
            "message" => ErrorHelpers.traverse_errors(changeset)
          }
      end

    render(conn, "index.json", %{"data" => message})
  end

  def cancel(conn, %{"user_event_id" => user_event_id}) do
    data =
      case Rsvps.cancel(user_event_id) do
        _ ->
          nil
      end

    render(conn, "index.json", %{"data" => data})
  end

  def events(conn, params) do
    data = nil
    render(conn, "index.json", %{"data" => data})
  end
end
