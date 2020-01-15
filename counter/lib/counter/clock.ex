defmodule Clock do
  def start(fun) do
    run(fun, 0)
  end

  defp run(fun, click) do
    fun.(click)
    click = Counter.Core.inc(click)
    :timer.sleep(1000)
    run(fun, click)
  end
end
