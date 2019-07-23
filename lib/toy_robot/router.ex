defmodule ToyRobot.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  post "/move" do
    robot = GenServer.call(ToyRobot.Game.Robot, :move)
    send_resp(conn, 200, inspect(robot))
  end

  post "/turn_right" do
    robot = GenServer.call(ToyRobot.Game.Robot, :turn_right)
    send_resp(conn, 200, inspect(robot))
  end

  post "/turn_left" do
    robot = GenServer.call(ToyRobot.Game.Robot, :turn_left)
    send_resp(conn, 200, inspect(robot))
  end

  get "/report" do
    robot = GenServer.call(ToyRobot.Game.Robot, :report)
    send_resp(conn, 200, inspect(robot))
  end
end
