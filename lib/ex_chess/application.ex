defmodule ExChess.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Registry for mapping "game_id" -> pid
      {Registry, keys: :unique, name: :games},

      # DynamicSupervisor to manage games
      {DynamicSupervisor, strategy: :one_for_one, name: :dyn}
    ]

    Supervisor.start_link(children, [strategy: :one_for_one, name: ExChess.Supervisor])
  end
end
