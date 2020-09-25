defmodule Events.Rsvps do
  import Ecto.Query

  alias Events.Repo
  alias Events.Schema.Event
  alias Events.Schema.Rsvp

  def add(params) do
    Repo.insert(Rsvp.changeset(%Rsvp{}, params))
  end

  def my_events(email) do
    Repo.all(from r in Rsvp, where: [user_mail: ^email], preload: [:event])
  end

  def cancel(user_event_id) do
    user_event = Repo.get(Rsvp, user_event_id)

    user_event
    |> Rsvp.changeset(%{is_going: false})
    |> Repo.update!()
  end
end
