defmodule CliThings.Terminal.Layer02.TextInput do
  alias CliThings.Terminal.Layer00.Terminal

  import CliThings.Terminal.Layer01.Output

  alias CliThings.Terminal.Layer02.TextInput.TextState

  alias ExTermbox.Event

  def get_user_input() do
    TextState.start_link()

    Terminal.loop(&on_event/1)
  end

  defp on_event(%Event{} = event) do
    case event do
      %Event{ch: ?q} ->
        result = TextState.flush()
        TextState.stop()

        if length(result) == 0 do
          # This will be returned by Terminal.loop to the caller (capture.ex) as {:ok, :cancelled}
          {:break, :cancelled}
        else
          # This will be returned by Terminal.loop to the caller (capture.ex) as {:ok, result}
          {:break, result}
        end

      %Event{ch: char} ->
        # put input in a random position for now.
        TextState.append_char(char)
        output_line('#{char}')
        :handled
    end
  end
end
