defmodule CliThings.Terminal.Layer01.Output do
  alias ExTermbox.Bindings, as: Termbox

  import CliThings.Terminal.Layer01.PutCharacter

  @spec output(list(list())) :: list
  def output(lines) when is_list(lines) do
    output(lines, rand_y(), rand_x())
  end

  @spec output(list(list()), any, any) :: list
  def output(lines, y, x) when is_list(lines) do
    for {ln, idx_ln} <- Enum.with_index(lines) do
      output_line(ln, y + idx_ln, x)
    end
  end

  def output_line(line) when is_list(line) do
    output_line(line, rand_y(), rand_x())
  end

  def output_line(line, y, x) when is_list(line) do
    for {ch, idx_ch} <- Enum.with_index(line) do
      put_character(ch, y, x + idx_ch)
    end
  end

  def debug_msg(msg) do
    y = 0
    x = 1

    for {ch, idx_ch} <- Enum.with_index(msg) do
      # ideally we don't want Termbox in this module.
      # here we make an exception, because debug messages
      # need to be reliable. (maybe debug logging should go somewhere else)
      put_character(ch, y, x + idx_ch)
      Termbox.present()
    end
  end

  defp rand_y() do
    {:ok, max_height} = ExTermbox.Bindings.height()
    :rand.uniform(max_height)
  end

  defp rand_x() do
    {:ok, max_width} = ExTermbox.Bindings.width()
    :rand.uniform(max_width)
  end
end
