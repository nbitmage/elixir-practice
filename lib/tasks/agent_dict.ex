defmodule Tasks.Frequency do
  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def add_word(word) do
    Agent.update(__MODULE__,
      fn map -> Map.update(map, word, 1, &(&1+1)) end)
  end

  def count_for(word) do
    Agent.get(__MODULE__, fn map -> map[word] end)
  end

  def words do
    Agent.get(__MODULE__, fn map -> Map.keys(map) end)
  end

  def run do
    __MODULE__.start_link
    __MODULE__.add_word "dave"
    __MODULE__.words
    __MODULE__.add_word "was"
    __MODULE__.add_word "here"
    __MODULE__.add_word "he"
    __MODULE__.add_word "was"
    IO.inspect __MODULE__.words
    IO.inspect __MODULE__.count_for("dave")
    IO.inspect __MODULE__.count_for("was")
  end
end
