defmodule ToyRobot.Game.Robot do
  alias ToyRobot.Robot

  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(%{north: north, east: east, facing: facing}) do
    {:ok, %Robot{north: north, east: east, facing: facing}}
  end

  def handle_call(:move, _from, robot) do
    new_robot = robot |> Robot.move
    {:reply, new_robot, new_robot}
  end

  def handle_call(:turn_left, _from, robot) do
    new_robot = robot |> Robot.turn_left
    {:reply, new_robot, new_robot}
  end

  def handle_call(:turn_right, _from, robot) do
    new_robot = robot |> Robot.turn_right
    {:reply, new_robot, new_robot}
  end
end
