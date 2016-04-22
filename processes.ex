defmodule ProcessTest do
  def loop do
    receive do
      {:ok, msg} -> IO.puts("I got a message: #{msg}")
      _ -> IO.puts "I don't understand that..."
    end
    loop
  end
end
