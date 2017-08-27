defmodule Pingpong do

  def start do
    first = spawn(Pingpong, :loop, [])
    second = spawn(Pingpong, :loop, [])
    send(first, {:ping, second})
  end

  def loop do
      random_number = :rand.uniform(2) * 1000
      receive do
          {:ping, process} ->
              :timer.sleep(random_number)
              IO.puts "ping"
              send(process, {:pong, self()})
          {:pong, process} ->
              :timer.sleep(random_number)
              IO.puts "pong"
              send(process, {:ping, self()})
      end
      loop()
  end
end
