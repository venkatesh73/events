defmodule Events.Schema.Event do
  use Ecto.Schema

  import Ecto.Changeset

  @derive {Jason.Encoder, except: [:__meta__]}
  schema "event" do
    field :descp, :string, null: false
    field :type, :string, null: false
    field :date, :utc_datetime, null: false
    field :duration, :integer, null: false
    field :host, :string, null: false
    field :location, :string, null: false

    has_many :rsvp, Events.Schema.Rsvp
    
    timestamps()
  end

  def changeset(event, attrs \\ %{}) do
    required_fields = __schema__(:fields) -- [:id, :inserted_at, :updated_at]
    
    event
    |> cast(attrs, required_fields)
    |> validate_required(required_fields)
    |> validate_number(:duration, greater_than_or_equal_to: 10)
    |> validate_host_date()
  end

  defp validate_host_date(changeset) do
    today = DateTime.utc_now()
    validate_change(changeset, :date, fn (current_field, host_date) -> 
      if host_date < today do
        [{current_field, "Host date should be a future date."}]
      else
        []
      end
    end)
  end
end