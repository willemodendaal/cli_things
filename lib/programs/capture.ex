defmodule CliThings.Programs.Capture do
  alias CliThings.Terminal.Layer00.Terminal

  import CliThings.Terminal.Layer01.Output
  import CliThings.Terminal.Layer01.Blip

  alias CliThings.Terminal.Layer02.TextInput

  alias ExTermbox.{Event}

  def loop do
    render_menu()

    Terminal.loop(&on_event/1)
  end

  def on_event(%Event{} = event) do
    case event do
      %Event{ch: ?q} ->
        :break

      %Event{ch: ?c} ->
        case TextInput.get_user_input() do
          {:ok, :cancelled} ->
            render_menu()

          {:ok, text} ->
            output_line('You typed: #{text}', 10, 2)
        end

        :handled

      _ ->
        blip()
        :handled
    end
  end

  def render_menu() do
    Terminal.clear()

    output(
      [
        '* * * *  * * * *',
        '* CAPTURE TEXT *',
        '* * * *  * * * * ',
        '<c> to launch a textbox',
        '<q> to quit'
      ],
      2,
      2
    )
  end
end
