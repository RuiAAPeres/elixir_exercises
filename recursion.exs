defmodule Recursion do
  def sum(arg1, acc \\ 0)
  def sum([head | tail], acc), do: sum(tail, acc + head)
  def sum([], acc), do: acc
end
