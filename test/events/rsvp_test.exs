defmodule Events.RsvpTest do
  use Events.DataCase

  alias Events.Schema.Rsvp

  describe "Rsvp Schema" do
    test "invalid" do
      changeset = Rsvp.changeset(%Rsvp{}, %{})
      refute changeset.valid?
    end

    test "valid" do
      changeset =
        Rsvp.changeset(%Rsvp{}, %{
          "user_mail" => "venkatesh.shanmugham@gmail.com",
          "event_id" => 1
        })

      assert changeset.valid?
    end
  end
end
