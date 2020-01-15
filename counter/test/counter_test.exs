defmodule CounterTest do
  use ExUnit.Case
  alias Counter.Core

  test "inc increments value by 1" do
    assert Core.inc(1) == 2
  end
end
