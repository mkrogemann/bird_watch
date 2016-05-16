defmodule BirdWatch.Sighting do

  @derive [Poison.Encoder]
  defstruct [:_id, :type, :bird_link, :location, :date]
end
