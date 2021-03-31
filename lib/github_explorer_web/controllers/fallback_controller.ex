defmodule GithubExplorerWeb.FallbackController do
  use GithubExplorerWeb, :controller

  alias GithubExplorer.Error
  alias GithubExplorerWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
