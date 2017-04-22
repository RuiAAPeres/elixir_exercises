defmodule Recursion do
  def sum(arg1), do: sum(arg1, 0)
  defp sum([head | tail], acc), do: sum(tail, acc + head)
  defp sum([], acc), do: acc

  def fibo(n) do
    case n do
      0 -> 0
      1 -> 1
      _ -> fibo(n, 0, 1)
    end
  end

  defp fibo(n, x, y) do
    case n do
      0 -> x
      _ -> fibo(n - 1, y, x+y)
    end
  end
end

Enum.reduce([1, 2, 3], &+/2)
