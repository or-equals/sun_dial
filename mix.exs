defmodule SunDial.MixProject do
  use Mix.Project

  def project do
    [
      app: :sun_dial,
      version: "0.2.0",
      description: "Useful Date and Time Helpers",
      source_url: "http://github.com/or-equals/sun_dial",
      elixir: "~> 1.13",
      package: package(),
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
      {:tzdata, "~> 1.1"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Joshua Plicque"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/or-equals/sun_dial"},
      files: [
        "lib/sun_dial.ex",
        "mix.exs",
        "README.md"
      ]
    ]
  end
end
