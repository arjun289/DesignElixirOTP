defmodule Mastery.Core.Template do
  @moduledoc """
  Module to define the structure for question templates.
  """

  defstruct ~w[name category instructions raw compiled generators checker]a
end
