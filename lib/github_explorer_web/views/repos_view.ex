defmodule GithubExplorerWeb.ReposView do
  use GithubExplorerWeb, :view

  def render("repos.json", %{repos: repos}), do: repos
end
