defmodule ToyRobot.Robot do
  defstruct [north: 0, east: 0, facing: :north]

  def place(x,y,f) do
    %ToyRobot.Robot{east: x, north: y, facing: f}
  end

  def move(%ToyRobot.Robot{facing: facing} = robot) do
    case facing do
      :north -> robot |> move_north
      :east -> robot |> move_east
      :south -> robot |> move_south
      :west -> robot |> move_west
    end
  end

  defp move_east(%ToyRobot.Robot{} = robot) do
    if on_positive_edge?(robot.east), do: robot, else: %ToyRobot.Robot{ robot | east: robot.east + 1}
  end

  defp move_west(%ToyRobot.Robot{} = robot) do
    %ToyRobot.Robot{ robot | east: robot.east - 1}
  end

  defp move_north(%ToyRobot.Robot{} = robot) do
    if on_positive_edge?(robot.north), do: robot, else: %ToyRobot.Robot{ robot | north: robot.north + 1}
  end

  defp move_south(%ToyRobot.Robot{} = robot) do
    %ToyRobot.Robot{ robot | north: robot.north - 1}
  end

  def turn_left(%ToyRobot.Robot{facing: facing} = robot) do
    new_facing = case facing do
      :north -> :west
      :east -> :north
      :south -> :east
      :west -> :south
    end

    %ToyRobot.Robot{ robot | facing: new_facing }
  end

  def turn_right(%ToyRobot.Robot{facing: facing} = robot) do
    new_facing = case facing do
      :north -> :east
      :east -> :south
      :south -> :west
      :west -> :north
    end

    %ToyRobot.Robot{ robot | facing: new_facing }
  end

  def on_positive_edge?(n) do
    if n >= 4, do: true, else: false
  end

  def on_negative_edge?(n) do
    if n < 1, do: true, else: false
  end
end
