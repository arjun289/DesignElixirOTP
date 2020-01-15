defmodule Counter.Core do
  @moduledoc """
  Holds the core logic for counter
  """

  @doc """
  Increments the input by 1 and returns it.
  """
  @spec inc(number) :: number
  def inc(value) do
    value + 1
  end
end
