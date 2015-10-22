defmodule Qiniu.Mixfile do
  use Mix.Project

  @version "0.2.1"

  def project do
    [app: :qiniu,
     version: @version,
     elixir: "~> 1.0",
     deps: deps,

     # Hex
     description: description,
     package: package
    ]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [{:poison, "~> 1.5.0"},
     {:httpoison, "~> 0.7.2"},
     {:ex_doc, "~> 0.7", only: :docs},
     {:earmark, "~> 0.1", only: :docs},
     {:inch_ex, only: :docs},
     {:mock, "~> 0.1.0", only: :test}
    ]
  end

  defp description do
    "Qiniu Resource (Cloud) Storage SDK for Elixir"
  end

  defp package do
    [contributors: ["Tony Han"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/tony612/qiniu"},
     files: ~w(mix.exs README.md CHANGELOG.md lib config)]
  end

end
