defmodule Events.Repo.Migrations.AddRsvpCancelledField do
  use Ecto.Migration

  def change do
    alter table("rsvp") do
      add :is_cancelled, :boolean, default: false
    end
  end
end
