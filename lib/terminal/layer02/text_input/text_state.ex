defmodule CliThings.Terminal.Layer02.TextInput.TextState do
  @moduledoc """
  A genserver that keeps track of textbox state.
  """
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def stop() do
    GenServer.stop(__MODULE__)
  end

  def append_char(ch) do
    :ok = GenServer.call(__MODULE__, {:append, ch})
  end

  @doc """
  Return all characters that this keeps track of.
  """
  def flush() do
    # todo: flush is a bad name. Because this doesn't delete state. It just returns what we have.
    {:ok, chars} = GenServer.call(__MODULE__, :flush)
    chars
  end

  # Server (callbacks)
  @impl true
  def init(_) do
    {:ok, %{characters: []}}
  end

  @impl true
  def handle_call({:append, ch}, _from, %{characters: chars} = _state) do
    {:reply, :ok, %{characters: [ch | chars]}}
  end

  def handle_call(:flush, _from, %{characters: chars} = state) do
    {:reply, {:ok, chars}, state}
  end
end
