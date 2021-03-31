defmodule GithubExplorer do
  alias GithubExplorer.Repositories.Get, as: GetUserRepos
  defdelegate get_user_repos(username), to: GetUserRepos, as: :call
end
