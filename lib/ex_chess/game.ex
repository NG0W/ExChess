defmodule ExChess.Game do
  @moduledoc false

  use GenServer

  def start_link(game_id), do: GenServer.start_link(__MODULE__, game_id, name: {:via, Registry, {:games, game_id}})

  @impl true
  def init(_args) do
    {:ok, ExChess.Board.new}
  end

  @impl true
  def handle_call({:play, move}, _from, state) do
    {:reply, ExChess.Board.play(move), state}
  end
end
