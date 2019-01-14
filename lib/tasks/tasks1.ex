defmodule Tasks.Tasks1.Fib do
  def of(0), do: 0
  def of(1), do: 1
  def of(n), do: __MODULE__.of(n - 1) + __MODULE__.of(n - 2)

  def run do
    IO.puts "Start the task"
    worker = Task.async(fn -> __MODULE__.of(20) end)
    IO.puts "Do something else"
    # ...
    IO.puts "Wait for the task"
    result = Task.await(worker)

    IO.puts "The result is #{result}"
  end
end
