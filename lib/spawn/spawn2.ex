defmodule Spawn.Spawn2 do
  def greet do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello, #{msg}"}
    end
  end

  def main do
    pid = spawn(__MODULE__, :greet, [])
    send pid, {self, "World!"}

    receive do
      {:ok, msg} ->
        IO.puts msg
    end

    send pid, {self, "Kermit!"}
    receive do
      {:ok, msg} ->
        IO.puts msg
    end
    # This will freeze
  end
end
