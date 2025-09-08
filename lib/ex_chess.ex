defmodule ExChess do
  @moduledoc false

  def whereis(game_id) do
    case Registry.lookup(:games, game_id) do
      [{pid, _}] -> {:ok, pid}
      [] -> :error
    end
  end

  def start(game_id) do
    case whereis(game_id) do
      {:ok, pid} -> pid # Return the PID if the game is already started
      :error -> DynamicSupervisor.start_child(:dyn, {ExChess.Game, game_id}) # Starts a new game
    end
  end

  @doc "Function play is going to be used with algebraic notation"
  def play(game_id, move) do
    case whereis(game_id) do
      {:ok, pid} -> GenServer.call(pid, {:play, move})
      :error -> "Start the game first!"
    end
  end
end
