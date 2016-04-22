defmodule GenIncrement do
  use GenServer

  # Public API
  def start_link do
    GenServer.start_link(GenIncrement, [], name: HamSandwich)
  end

  def increment(pid) do
    GenServer.cast(pid, {:increment})
  end

  def decrement(pid) do
    GenServer.cast(pid, {:decrement})
  end

  def reset(pid) do
    GenServer.cast(pid, {:reset})
  end

  def status(pid) do
    GenServer.call(pid, {:status})
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


