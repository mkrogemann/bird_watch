defmodule BirdWatch.Bird do

  @derive [Poison.Encoder]
  defstruct [:_id, :type, :name, :link, :location, :image, :date, :attribution, :attribution_link]
end
