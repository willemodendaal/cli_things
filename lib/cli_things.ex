defmodule CliThings do
  alias ExTermbox.Bindings, as: Termbox
  alias ExTermbox.{Cell, EventManager, Event, Position}

  @rev 1
  @fast_mode true

  def hello do
    init()
    println("CLI tools - r#{@rev}", then_wait: 1500)
    println("--------------------", then_wait: 2500)
    println("Greetings human.", then_wait: 2000)
    print("What are we doing today?", then_wait: 1000)

    render_version()

    # give_options([
    #  {1, ""}
    # ])
  end

  def render_version() do
    :ok = Termbox.put_cell(%Cell{position: %Position{x: 10, y: 7}, ch: ?^})
    Termbox.present()
    IO.write("I am rev-#{@rev} (press q to quit)")

    receive do
      {:event, %Event{ch: ?q}} ->
        :ok = Termbox.shutdown()
    end
  end

  def init do
    # Do termbox setup things.
    :ok = Termbox.init()
    {:ok, _pid} = EventManager.start_link()
    :ok = EventManager.subscribe(self())
  end

  def println(msg, args) do
    print(msg <> "\n\r", args)
  end

  def print(msg, then_wait: wait_amount) do
    IO.write(msg)

    if not @fast_mode do
      sleep(wait_amount)
    end
  end

  defp sleep(ms) do
    Process.sleep(ms)
  end
end
