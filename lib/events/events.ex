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

  def update(params) do
  end

  def delete(id) do
  end

  def list() do
    Repo.all(from e in Event, preload: [:rsvp])
  end

  def get(id) do
  end
end