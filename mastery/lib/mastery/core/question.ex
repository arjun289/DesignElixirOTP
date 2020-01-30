defmodule Mastery.Core.Question do
  @moduledoc """
  Module to define struct for a question based on different
  templates.
  """
  alias Mastery.Core.Template

  defstruct ~w[asked questions template]a

  ################### private functions ###############

  defp build_substitution({name, choices_or_generator}) do
    {name, choose(choices_or_generator)}
  end

  defp choose(choices) when is_list(choices) do
    Enum.random(choices)
  end

  defp choose(generator) when is_function(generator) do
    generator.()
  end
end
