defmodule BirdWatch.BirdView do
  use BirdWatch.Web, :view

  def info(bird) do
    bird["value"]["attribution"]
  end

end
