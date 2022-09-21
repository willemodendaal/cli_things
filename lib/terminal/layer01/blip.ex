defmodule CliThings.Terminal.Layer01.Blip do
  import CliThings.Terminal.Layer00.{Output, AnyOfThese}

  def blip(characters \\ '.*☼   ★・') do
    random_character = any_of_these(characters)
    # random_character = any_of_these('⭐✨🌟.:*   ')
    # random_character = any_of_these('🐈🦊🐻🦖💕💚.*`.*`')

    output_line([
      random_character
    ])

    # random_character = any_of_these('. ')

    output_line([
      random_character
    ])
  end
end
