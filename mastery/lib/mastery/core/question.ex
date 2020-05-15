defmodule Mastery.Core.Question do
  @moduledoc """
  Module to define struct for a question based on different
  templates.
  """
  alias Mastery.Core.Template

  defstruct ~w[asked substitutions template]a

  @typedoc """
  `asked`: The text for the question to be shown to the user.
  `substitutions`: The substitutions for the template.
  `template`: The template for the question.
  """
  @type t :: %__MODULE__{}

  @spec new(Template.t()) :: __MODULE__.t()
  def new(%Template{} = template) do
    template.generators
    |> Enum.map(&build_substitution/1)
    |> evaluate(template)
  end

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

  defp evaluate(substitutions, template) do
    %__MODULE__{
      asked: compile(template, substitutions),
      substitutions: substitutions,
      template: template
    }
  end

  defp compile(template, substitutions) do
    template.compiled
    |> Code.eval_quoted(assigns: substitutions)
    |> elem(0)
  end
end
