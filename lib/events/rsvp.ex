defmodule Events.Schema.Rsvp do
  use Ecto.Schema

  import Ecto.Changeset

  schema "rsvp" do
    field :user_mail, :string, null: false
    field :is_confirmed, :boolean, default: false
    field :is_going, :boolean, default: false
    
    belongs_to :event, Events.Schema.Event
    
    timestamps()
  end

  def changeset(rsvp, attrs \\ %{}) do
    rsvp
    |> cast(attrs, [:user_mail, :is_confirmed, :is_going, :event_id])
    |> validate_required([:user_mail, :is_confirmed, :is_going, :event_id])
    |> unique_constraint([:user_mail, :event_id], name: "user_event_index")
  end
end