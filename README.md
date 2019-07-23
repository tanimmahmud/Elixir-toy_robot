# ToyRobot

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `toy_robot` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:toy_robot, "~> 0.1.0"}
  ]
end
```

#### Start GenServer
on Terminal
```
iex -S mix
```
initialize robot

```
{:ok, robot} = GenServer.start(ToyRobot.Game.Robot, %{north: 0, east: 0, facing: :north})
```
to move robot
```
GenServer.call(robot, :move)
```
to use Router
to move
```
http post localhost:8080/move
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/toy_robot](https://hexdocs.pm/toy_robot).
