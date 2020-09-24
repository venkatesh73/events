defmodule Events.EventsTest do
  use Events.DataCase

  alias Events.Schema.Event

  describe "Events Schema" do
    setup do
      event = %{
        descp: "This is a Great event happening this Pandemic year.",
        type: "Music",
        date: ~U[2020-09-26 01:00:00.859111Z],
        duration: 180,
        host: "David Guttea",
        location: "Palace Ground, Bengaluru."
      }

      %{event: event}
    end

    test "invalid" do
      changeset = Event.changeset(%Event{}, %{})
      refute changeset.valid?
    end

    test "Duration should be greater than or equal to 10mins", %{event: event} do
      event = %{event | duration: 09}
      changeset = Event.changeset(%Event{}, event)

      {msg, _ } = Keyword.get(changeset.errors, :duration)
      assert msg == "must be greater than or equal to %{number}"

      refute changeset.valid?
    end

    test "Host date should be Future date", %{event: event} do
      event = %{event | date: DateTime.utc_now()}
      changeset = Event.changeset(%Event{}, event)

      {msg, _ } = Keyword.get(changeset.errors, :date)
      assert msg == "Host date should be a future date."
      refute changeset.valid?
    end

    test "valid", %{event: event} do
      changeset = Event.changeset(%Event{}, event)
      assert changeset.valid?
    end
  end
end