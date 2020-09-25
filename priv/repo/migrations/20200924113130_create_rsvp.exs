defmodule Events.Repo.Migrations.CreateRsvp do
  use Ecto.Migration

  def change do
    create_if_not_exists table("rsvp") do
      add :user_mail, :string, null: false
      add :is_confirmed, :boolean, default: false
      add :is_going, :boolean, default: false
      add :event_id, references("event")

      timestamps()
    end

    create_if_not_exists unique_index(:rsvp, [:user_mail, :event_id], name: :user_event_index)
  end
end
