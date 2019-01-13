defmodule SequenceWithSupervisorTest do
  use ExUnit.Case
  doctest SequenceWithSupervisor

  test "greets the world" do
    assert SequenceWithSupervisor.hello() == :world
  end
end
