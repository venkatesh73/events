defmodule Events.Rsvps do
  import Ecto.Query

  alias Events.Repo
  alias Events.Schema.Rsvp

  def add(params) do
    Repo.insert(Rsvp.changeset(%Rsvp{}, params))
  end

  def my_events(email) do
    Repo.all(from r in Rsvp, where: [user_mail: ^email], preload: [:event])
  end

  def cancel(user_event_id) do
    user_event = Repo.get(Rsvp, user_event_id)

    if user_event do
      user_event
      |> Rsvp.changeset(%{is_going: false})
      |> Repo.update!()

      {:ok}
    else
      {:error, "Event doesn't exisits."}
    end
  end

  def counts(:rsvp) do
    query = from rsvp in Rsvp, where: [is_going: true]

    Repo.all(query)
    |> length
  end

  def counts(:cancel) do
    query = from rsvp in Rsvp, where: [is_going: false]

    Repo.all(query)
    |> length
  end

  def event_counts(:rsvp, event_id) do
    query = from rsvp in Rsvp, where: [is_going: true, event_id: ^event_id]

    Repo.all(query)
    |> length
  end

  def event_counts(:cancel, event_id) do
    query = from rsvp in Rsvp, where: [is_going: false, event_id: ^event_id]

    Repo.all(query)
    |> length
  end

  def confirm(rsvp_id) do
    rsvp = Repo.get_by(Rsvp, id: rsvp_id, is_going: true)

    if rsvp do
      rsvp
      |> Rsvp.changeset(%{is_confirmed: true, is_cancelled: false})
      |> Repo.update!()

      {:ok}
    else
      {:error, "No user RSVP for the selected Event"}
    end
  end

  def remove(rsvp_id) do
    rsvp = Repo.get_by(Rsvp, id: rsvp_id, is_confirmed: true)

    if rsvp do
      rsvp
      |> Rsvp.changeset(%{is_cancelled: true, is_confirmed: false})
      |> Repo.update!()

      {:ok}
    else
      {:error, "No user RSVP for the selected Event"}
    end
  end
end
