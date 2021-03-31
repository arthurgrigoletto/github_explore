defmodule GithubExplorer.Repo do
  use Ecto.Repo,
    otp_app: :github_explorer,
    adapter: Ecto.Adapters.Postgres
end
