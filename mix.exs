defmodule Issues.MixProject do
  use Mix.Project

  def project do
    [
      app: :issues,
      escript: escript_config,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Issues",
      source_url: "http://example.com"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      { :httpoison, "~> 0.8" },
      { :poison, "~> 1.5" },
      { :ex_doc, "~> 0.11" },
      { :earmark, ">= 0.0.0" }
    ]
  end

  defp escript_config do
    [main_module: Issues.CLI]
  end
end
