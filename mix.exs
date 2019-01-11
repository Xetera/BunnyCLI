defmodule Bunnycli.MixProject do
  use Mix.Project

  def project do
    [
      app: :bunnycli,
      version: "0.1.0",
      elixir: "~> 1.7",
      escript: [main_module: Bunnycli.Entry],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.4"},
      {:poison, "~> 3.1"},
      {:progress_bar, "~> 2.0"}
    ]
  end
end
