defmodule Mastery.Core.Template do
  @moduledoc """
  Module to define the structure for question templates.
  """

  defstruct ~w[name category instructions raw compiled generators checker]a

  @typedoc """
  `name`: name of the template.
  `category`:
  `instructions`: instructions for the user to how to approach the problems
                created using the template.
  `raw`: code to generate the questions from this template a typical example
    would be "<%= left %> + <%= right %>".
  `compiled`:
  `generators`: would be used to fill in the substitutions.
  `checker`: checker function to check for correct answer.
  """

  @type t :: %__MODULE__{}

  def new(fields) do
    raw = Keyword.fetch!(fields, :raw)
    struct!(__MODULE__, Keyword.put(fields, :compiled, EEx.compile_string(raw)))
  end


end
