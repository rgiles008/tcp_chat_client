defmodule Chat.AcceptorPool.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Registry, keys: :duplicate, name: Chat.BroadcastRegistry},
      {Registry, keys: :unique, name: Chat.UsernameRegistry},
      {Chat.AcceptorPool.ConnectionSupervisor, []},
      {Chat.AcceptorPool.TCPSupervisor, port: 4000}
    ]

    opts = [strategy: :one_for_one, name: Chat.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
