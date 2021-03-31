defmodule GithubExplorer.Repositories.Get do
  alias GithubExplorer.{Error}
  alias GithubExplorer.Github.Client

  def call(username) do
    case Client.get_user_repos(username) do
      {:error, %Error{}} = error -> error
      {:ok, _result} = result -> result
    end
  end
end
