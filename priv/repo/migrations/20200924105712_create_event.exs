defmodule Events.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
  	create_if_not_exists table("event") do
  		add :descp, :string, null: false
	    add :type, :string, null: false
	    add :date, :utc_datetime, null: false
	    add :duration, :integer, null: false
	    add :host, :string, null: false
	    add :location, :string, null: false

    	timestamps()
  	end
  end
end
