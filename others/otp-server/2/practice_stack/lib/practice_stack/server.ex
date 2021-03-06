defmodule PracticeStack.Server do
  use GenServer

  #####
  # Public API

  # OTP-Servers-3 & OTP-Servers-4
  def start_link(current_stack) do
    GenServer.start_link(__MODULE__, current_stack, name: __MODULE__)
  end
  
  def pop do
    GenServer.call(__MODULE__, :pop)
  end

  def push(value) do
    GenServer.cast(__MODULE__, { :push, value })
  end

  #####
  # GenServer implementation

  def handle_call(:pop, _from, current_stack) do
    [ head | tail ] = current_stack
    { :reply, head, tail }
  end

  def handle_cast({:push, new_value}, current_stack) do
    { :noreply, [ new_value | current_stack ] }
  end

  # OTP-Servers-5
  def terminate(reason, state) do
  end
end
