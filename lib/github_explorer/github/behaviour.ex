defmodule GithubExplorer.Github.Behaviour do
  alias GithubExplorer.Error

  @callback get_user_repos(String.t()) :: {:ok, list()} | {:error, Error.t()}
end
