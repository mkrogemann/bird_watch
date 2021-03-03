defmodule BirdWatch.Bird do
  @derive [Poison.Encoder]
  defstruct [:_id, :name, :link, :location, :image, :date, :attribution, :attribution_link]
end
