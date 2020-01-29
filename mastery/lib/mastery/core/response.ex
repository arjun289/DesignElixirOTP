defmodule Mastery.Core.Response do
  @moduledoc """
  Module to define struct for the response of a question.
  """

  defstruct ~w[quiz_title template_name to email answer correct timestamp]a
end
