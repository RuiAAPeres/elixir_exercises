defmodule EagerLazy  do
  def odd?(x) do
      rem(x, 2) == 0
  end
  def pipeMeUp(x) do
    1..x
    |> Enum.map(&(&1 + 3))
    |> Enum.filter(&odd?/1)
    |> Enum.sum
  end

  def pipeMeUpLazyEdition(x) do
    1..x
    |> Stream.map(&(&1 + 3))
    |> Stream.filter(&odd?/1)
  end
end
