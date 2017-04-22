defmodule Spawning do
  def listening do
    receive do
      {:hello, msg} -> msg
      {:world, msg} -> "won't match"
    after
      1_000 -> "yolo I am out of here 🤷‍♂️"
    end
  end
end
