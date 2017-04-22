defmodule Recursion do
  def sum(arg1), do: sum(arg1, 0)
  defp sum([head | tail], acc), do: sum(tail, acc + head)
  defp sum([], acc), do: acc

  def fibo(0), do: 0
  def fibo(1), do: 1
  def fibo(arg1), do: fibo(arg1, 0, 1)
  defp fibo(0, x, y), do: x + y
  defp fibo(n, x, y), do: fibo(n - 1, y, x+y)
end
