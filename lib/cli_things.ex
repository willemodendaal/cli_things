defmodule CliThings do
  alias CliThings.Terminal.Layer00.Terminal

  def hello do
    Terminal.init()
    Terminal.clear()

    CliThings.Programs.Root.loop()

    Terminal.stop()
  end
end
