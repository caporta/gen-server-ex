defmodule GenIncrement do
  use GenServer

  # Public API
  def start_link do
    GenServer.start_link(GenIncrement, [], name: __MODULE__)
    # Process.register(pid, __MODULE__) done automatically by .start_link
  end

  def increment do
    GenServer.cast(__MODULE__, {:increment})
  end

  def decrement do
    GenServer.cast(__MODULE__, {:decrement})
  end

  def reset do
    GenServer.cast(__MODULE__, {:reset})
  end

  def status do
    GenServer.call(__MODULE__, {:status})
  end


  # Private API
  def init(_) do
    {:ok, 0}
  end

  def handle_cast({:increment}, count) do
    {:noreply, count + 1}
  end

  def handle_cast({:decrement}, count) do
    {:noreply, count + 1}
  end

  def handle_cast({:reset}, count) do
    {:noreply, count + 1}
  end

  def handle_call({:status}, _pid, count) do
    reply_with = count
    next_state = count
    {:reply, reply_with, next_state}
  end
end
