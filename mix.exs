defmodule ExChess.MixProject do
  @moduledoc false

  use Mix.Project

  def project do
    [
      app: :exchess,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application, do: [extra_applications: [:logger], mod: {ExChess.Application, []}]

  defp deps, do: []
end
