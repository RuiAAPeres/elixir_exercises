defmodule Chapter2 do
  def sum([]), do: 0
  def sum([head | tail]), do: sum(head) + sum(tail)
  def sum(head), do: head

  def flatten([]), do: []
  def flatten([head | tail]), do: flatten(head) ++ flatten(tail)
  def flatten(head), do: [head]

  def invertAndDouble(list) do
    list
    |>flatten
    |> Enum.map(&(&1*2))
    |> Enum.reverse
  end

  def crypto(input) do
    :crypto.hash(:md5 , input)
  end
end
