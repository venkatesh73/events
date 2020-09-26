defmodule Events.Events do
  import Ecto.Query

  alias Events.Repo
  alias Events.Schema.Event

  def create(params) do
    case Repo.insert(Event.changeset(%Event{}, params)) do
      {:ok, _} ->
        {:ok}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  def update(%{"id" => id} = params) do
    event = get(id)

    event
    |> Event.changeset(params)
    |> Repo.update()
  end

  def delete(id) do
    event = get(id)

    event
    |> Repo.delete()
  end

  def list() do
    Repo.all(from e in Event, preload: [:rsvp])
  end

  def get(id) do
    Repo.get(Event, id)
  end
end
