defmodule Cache.Worker do
    use GenServer

    @name Cache
    ## Client API
    def start_link(opts \\ []) do
        GenServer.start_link(__MODULE__, :ok, opts ++ [name: Cache])
    end

    def write(key, value) do
        GenServer.call(@name, {:write, {key, value}})
    end

    def read(key) do
        GenServer.call(@name, {:read, key})
    end

    def exists?(key) do
        GenServer.call(@name, {:exists, key})
    end

    def clear() do
        GenServer.cast(@name, :clear)
    end

    def delete(key) do
        GenServer.cast(@name, {:delete, key})
    end

    ## Server Callbacks
    def init(:ok) do
        {:ok, %{}}
    end

    def handle_call({:write, {key, value}}, _from, stats) do
        new_stats = Map.put(stats, key, value)
        {:reply, new_stats, new_stats}
    end

    def handle_call({:read, key}, _from, stats) do
        {:reply, stats[key], stats}
    end

    def handle_call({:exists, key}, _from, stats) do
        {:reply, Map.has_key?(stats, key), stats}
    end

    def handle_cast({:delete, key}, stats) do
        new_stats = Map.delete(stats, key)
        {:noreply, new_stats}
    end

    def handle_cast(:clear, _stats) do
        {:noreply, %{}}
    end
end
