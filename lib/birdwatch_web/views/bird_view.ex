defmodule BirdWatchWeb.BirdView do
  use BirdWatchWeb, :view

  def info(bird) do
    bird["value"]["attribution"]
  end
end
