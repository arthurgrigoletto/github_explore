ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(GithubExplorer.Repo, :manual)

Mox.defmock(GithubExplorer.Github.ClientMock, for: GithubExplorer.Github.Behaviour)
