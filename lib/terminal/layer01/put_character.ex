defmodule CliThings.Terminal.Layer00.PutCharacter do
  alias ExTermbox.Bindings, as: Termbox
  alias ExTermbox.{Cell, Position}

  def put_character(ch, y, x) do
    Process.sleep(5 + :rand.uniform(10))

    # term_256 color lookup over here: https://www.ditig.com/256-colors-cheat-sheet

    # Subtle green:
    fg = Enum.random(83..84)

    # Rainbow:
    # fg = Enum.random(1..255)

    :ok = Termbox.put_cell(%Cell{position: %Position{x: x, y: y}, ch: ch, fg: fg})

    Termbox.present()
  end
end
