defmodule Recursion do
  def sum(arg1), do: sum(arg1, 0)
  defp sum([head | tail], acc), do: sum(tail, acc + head)
  defp sum([], acc), do: acc
end
