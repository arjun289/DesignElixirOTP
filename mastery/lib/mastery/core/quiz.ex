defmodule Mastery.Core.Quiz do
  @moduledoc """
  Models the structure of a quiz.
  """

  defstruct title: nil,
            mastery: 3,
            templates: %{},
            used: [],
            current_question: nil,
            last_response: nil,
            record: %{},
            mastered: []
end
