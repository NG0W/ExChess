defmodule ExChess.Board do
  @moduledoc false

  def new do
    for x <- 1..8, y <- 1..8, into: %{} do
      piece = case {x, y} do
        # White pieces
        {1, 1} -> :wr
        {2, 1} -> :wn
        {3, 1} -> :wb
        {4, 1} -> :wq
        {5, 1} -> :wk
        {6, 1} -> :wb
        {7, 1} -> :wn
        {8, 1} -> :wr

        # White pawns
        {_, 2} -> :wp

        # Black pawns
        {_, 7} -> :bp

        # Black pieces
        {1, 8} -> :br
        {2, 8} -> :bn
        {3, 8} -> :bb
        {4, 8} -> :bq
        {5, 8} -> :bk
        {6, 8} -> :bb
        {7, 8} -> :bn
        {8, 8} -> :br

        # Empty
        {_, _} -> :na
      end

      {{x, y}, piece}
    end
  end

  def play(move) do
    IO.puts(correct?(move))
    move
  end

  def correct?(move) do
    patterns = [
      ~r/^O-O(-O)?$/,
      ~r/^[KQRBN]?[a-h]?[1-8]?[a-h][1-8][+#]?$/,
      ~r/^[KQRBN]?[a-h]?[1-8]?x[a-h][1-8][+#]?$/,
      ~r/^[a-h][18]=[QRBN][+#]?$/,
      ~r/^[a-h]x[a-h][18]=[QRBN][+#]?$/,
      ~r/^[a-h]x[a-h][36]\s?e\.p\.$/
    ]

    Enum.any?(patterns, fn re -> Regex.match?(re, move) end)
  end
end
