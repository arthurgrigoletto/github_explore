defmodule GithubExplorerWeb.ReposController do
  use GithubExplorerWeb, :controller

  alias GithubExplorerWeb.FallbackController

  action_fallback FallbackController

  def index(conn, %{"username" => username}) do
    with {:ok, repos} <- GithubExplorer.get_user_repos(username) do
      conn
      |> put_status(:ok)
      |> render("repos.json", repos: repos)
    end
  end
end
