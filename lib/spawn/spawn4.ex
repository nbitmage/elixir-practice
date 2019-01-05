defmodule Spawn.Spawn4 do
  def greet do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello, #{msg}"}
        greet
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
      after 1000 ->
        IO.puts "The greeter has gone away"
    end
  end
end
