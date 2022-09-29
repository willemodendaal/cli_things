defmodule CliThings.Programs.Stars do
  alias CliThings.Terminal.Layer00.Terminal

  import CliThings.Terminal.Layer01.Output
  import CliThings.Terminal.Layer01.Blip

  alias CliThings.Programs.Stars.StarRenderer

  alias ExTermbox.{Event}

  def loop do
    Terminal.clear()

    output(
      [
        '* * * * * * * * * * * * * * * * *',
        '* Stars(running on a GenServer) *',
        '* * * * * * * * * * * * * * * * * ',
        '',
        '<q> to quit'
      ],
      2,
      2
    )

    StarRenderer.start_rendering_stars()

    Terminal.loop(&on_event/1)
  end

  def on_event(%Event{} = event) do
    case event do
      %Event{ch: ?q} ->
        StarRenderer.stop()
        :break

      _ ->
        blip()
        :handled
    end
  end
end
