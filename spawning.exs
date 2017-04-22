defmodule Spawning do
  def listening do
    receive do
      {:hello, msg} -> msg
      {:world, msg} -> "won't match"
    after
      1_000 -> "yolo I am out of here 🤷‍♂️"
    end
  end



  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
        {:put, key, value} ->
          loop(Map.put(map, key, value))
        end
      end
    end
