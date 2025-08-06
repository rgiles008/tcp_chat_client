defmodule Chat.ThousandIsland.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Registry, keys: :duplicate, name: Chat.BroadcastRegistry},
      {Registry, keys: :unique, name: Chat.UsernameRegistry},
      {ThousandIsland, port: 4000, handler_module: Chat.ThousandIsland.Handler}
    ]

    opts = [strategy: :one_for_one, name: Chat.Suprevisor]
    Supervisor.start_link(children, opts)
  end
end
