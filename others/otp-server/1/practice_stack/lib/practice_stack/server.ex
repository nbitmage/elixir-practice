defmodule PracticeStack.Server do
  use GenServer

  # OTP-Servers-1
  def handle_call(:pop, _from, current_stack) do
    [ head | tail ] = current_stack
    { :reply, head, tail }
  end

  # OTP-Servers-2
  def handle_cast({:push, new_value}, current_stack) do
    { :noreply, [ new_value | current_stack ] }
  end
end
