defmodule CounterAPITest do
  use ExUnit.Case, async: true
  alias Counter

  test "use counter through API" do
    pid = Counter.start(0)
    assert Counter.state(pid) == 0

    Counter.tick(pid)
    count = Counter.state(pid)
    assert count == 1
  end
end
