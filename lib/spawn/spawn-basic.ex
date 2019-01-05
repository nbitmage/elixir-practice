defmodule Spawn.SpawnBasic do
  def greet do
    IO.puts "Hello"
  end

  def main do
    IO.puts "Running in this process"
    __MODULE__.greet
    IO.puts "Spawn new process"
    spawn(__MODULE__, :greet, [])
  end
end
