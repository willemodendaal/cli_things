defmodule CliThings.Terminal.Layer01.AnyOfThese do
  def any_of_these(options) when is_list(options) do
    options |> Enum.random()
  end
end
