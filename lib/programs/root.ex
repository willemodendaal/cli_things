defmodule CliThings.Programs.Root do
  alias CliThings.Terminal.Layer00.Terminal

  import CliThings.Terminal.Layer01.Output
  import CliThings.Terminal.Layer01.Blip

  alias ExTermbox.{Event}

  def loop do
    Terminal.clear()
    output_prompt_and_options()
    Terminal.loop(&on_event/1)
  end

  def on_event(
        %Event{
          type: _type,
          mod: _mod,
          key: _key,
          ch: _ch,
          w: _w,
          h: _h,
          x: _x,
          y: _y
        } = event
      ) do
    case event do
      %Event{ch: ?q} ->
        :break

      %Event{ch: ?c} ->
        CliThings.Programs.Capture.loop()
        Terminal.clear()
        output_prompt_and_options(['Welcome back.'])
        :handled

      %Event{ch: ?s} ->
        CliThings.Programs.Stars.loop()
        Terminal.clear()
        output_prompt_and_options(['Welcome back.'])
        :handled

      _ ->
        blip('∆¬øˆ˚∆¥†´∑å√∫˜µ≤≥÷#$%')
        :handled
    end
  end

  defp output_prompt_and_options(
         first_messages \\ ['Greetings human', 'How may I serve you today?']
       ) do
    output(
      first_messages ++
        [
          '<c> to capture',
          '<s> to see stars',
          '<q> to quit',
          '',
          '/>'
        ],
      2,
      4
    )
  end
end
