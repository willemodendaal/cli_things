defmodule CliThingsTest do
  use ExUnit.Case
  doctest CliThings

  test "greets the world" do
    assert CliThings.hello() == :world
  end
end
