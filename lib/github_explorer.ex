defmodule GithubExplorer do
  alias GithubExplorer.Users.Create, as: CreateUser
  alias GithubExplorer.Repositories.Get, as: GetUserRepos

  defdelegate create_user(params), to: CreateUser, as: :call
  defdelegate get_user_repos(username), to: GetUserRepos, as: :call
end
