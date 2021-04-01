defmodule GithubExplorer.Github.Client do
  use Tesla

  alias GithubExplorer.Error
  alias GithubExplorer.Github.Behaviour
  alias Tesla.Env

  @behaviour Behaviour

  @base_url "https://api.github.com/"
  plug Tesla.Middleware.Headers, [{"user-agent", "Github Explorer"}]
  plug Tesla.Middleware.JSON

  def get_user_repos(url \\ @base_url, username) do
    "#{url}users/#{username}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 404, body: _body}}) do
    {:error, Error.build(:not_found, "User not found")}
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}) do
    repos =
      Enum.map(body, fn repo ->
        Map.take(repo, ["id", "name", "description", "html_url", "stargazers_count"])
      end)

    {:ok, repos}
  end

  defp handle_get({:error, reason}) do
    {:error, Error.build(:bad_request, reason)}
  end
end
