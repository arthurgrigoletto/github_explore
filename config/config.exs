# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :github_explorer,
  ecto_repos: [GithubExplorer.Repo]

config :github_explorer, GithubExplorer.Repositories.Get,
  github_adapter: GithubExplorer.Github.Client

config :github_explorer, GithubExplorer.Repo,
  migration_primary_key: [type: :binary_id],
  migration_foreign_key: [type: :binary_id]

config :github_explorer, GithubExplorerWeb.Auth.Guardian,
  issuer: "github_explorer",
  secret_key: "6NhygpTU8BeP8J+zvFST5sNEa7dafVLEydXMuoIO44tyvUex8Z+KOpt0z2Toqc/2"

config :github_explorer, GithubExplorerWeb.Auth.Pipeline,
  module: GithubExplorerWeb.Auth.Guardian,
  error_handler: GithubExplorerWeb.Auth.ErrorHandler

# Configures the endpoint
config :github_explorer, GithubExplorerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WICchVyKH0soUJ7JQtSwaCpreDWQwgcOSjsrkJnBti+oWTDOCsuBAzXt8t+HYz+y",
  render_errors: [view: GithubExplorerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GithubExplorer.PubSub,
  live_view: [signing_salt: "gTIpk5T2"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
