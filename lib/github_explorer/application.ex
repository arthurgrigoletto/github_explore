defmodule GithubExplorer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      GithubExplorer.Repo,
      # Start the Telemetry supervisor
      GithubExplorerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: GithubExplorer.PubSub},
      # Start the Endpoint (http/https)
      GithubExplorerWeb.Endpoint
      # Start a worker by calling: GithubExplorer.Worker.start_link(arg)
      # {GithubExplorer.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: GithubExplorer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GithubExplorerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
