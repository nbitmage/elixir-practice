defmodule Spawn.Spawn1 do
  def greet do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello #{msg}"}
    end
  end

  def main do
    pid = spawn(__MODULE__, :greet, [])
    send pid, {self, "World!"}
    receive do
      {:ok, msg} ->
        IO.puts "received: #{msg}"
    end
  end
end
