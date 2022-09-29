defmodule CliThings.Terminal.Layer00.Terminal do
  alias ExTermbox.Bindings, as: Termbox
  alias ExTermbox.{EventManager, Event, Constants}

  def init() do
    :ok = Termbox.init()
    {:ok, _} = Termbox.select_output_mode(Constants.output_mode(:term_256))

    {:ok, _pid} = EventManager.start_link()
    :ok = EventManager.subscribe(self())
  end

  def clear() do
    :ok = Termbox.clear()
  end

  def loop(event_handler) when is_function(event_handler) do
    receive do
      {:event, %Event{} = event} ->
        # todo: smelly... this callback mechanism ...
        case event_handler.(event) do
          {:break, result} -> {:ok, result}
          :break -> :ok
          :handled -> loop(event_handler)
        end
    end
  end

  def stop() do
    :ok = EventManager.stop()
    :ok = Termbox.shutdown()
  end

  # def on_event(
  #       %Event{
  #         type: _type,
  #         mod: _mod,
  #         key: _key,
  #         ch: _ch,
  #         w: _w,
  #         h: _h,
  #         x: _x,
  #         y: _y
  #       } = _data
  #     ) do
  #   # Do something.
  # end

  # def loop() when is_function(on_event) do
  # end
end
