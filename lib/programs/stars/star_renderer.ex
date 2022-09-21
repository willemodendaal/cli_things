defmodule CliThings.Programs.Stars.StarRenderer do
  use GenServer

  import CliThings.Terminal.Layer01.Blip

  def loop_to_render_stars() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
    GenServer.cast(__MODULE__, :render_a_star)
  end

  def stop() do
    GenServer.stop(__MODULE__)
  end

  def init(state) do
    {:ok, state}
  end

  def handle_cast(:render_a_star, state) do
    blip()
    Process.sleep(50)
    GenServer.cast(__MODULE__, :render_a_star)

    {:noreply, state}
  end
end
