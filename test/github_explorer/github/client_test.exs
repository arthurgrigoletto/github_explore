defmodule GithubExplorer.Github.ClientTest do
  use ExUnit.Case, async: true

  alias Plug.Conn
  alias GithubExplorer.Error
  alias GithubExplorer.Github.Client

  describe "get_user_repos/1" do
    setup do
      bypass = Bypass.open()

      {:ok, bypass: bypass}
    end

    defp endpoint_url(port), do: "http://localhost:#{port}/"

    test "should return user repos if user exists", %{bypass: bypass} do
      username = "arthurgrigoletto"

      url = endpoint_url(bypass.port)

      body = ~s([
        {
          "id": 348705163,
          "node_id": "MDEwOlJlcG9zaXRvcnkzNDg3MDUxNjM=",
          "name": "arthurgrigoletto-avantica",
          "full_name": "arthurgrigoletto/arthurgrigoletto-avantica",
          "private": false,
          "owner": {
            "login": "arthurgrigoletto",
            "id": 27973216,
            "node_id": "MDQ6VXNlcjI3OTczMjE2",
            "avatar_url": "https://avatars.githubusercontent.com/u/27973216?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/arthurgrigoletto",
            "html_url": "https://github.com/arthurgrigoletto",
            "followers_url": "https://api.github.com/users/arthurgrigoletto/followers",
            "following_url": "https://api.github.com/users/arthurgrigoletto/following{/other_user}",
            "gists_url": "https://api.github.com/users/arthurgrigoletto/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/arthurgrigoletto/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/arthurgrigoletto/subscriptions",
            "organizations_url": "https://api.github.com/users/arthurgrigoletto/orgs",
            "repos_url": "https://api.github.com/users/arthurgrigoletto/repos",
            "events_url": "https://api.github.com/users/arthurgrigoletto/events{/privacy}",
            "received_events_url": "https://api.github.com/users/arthurgrigoletto/received_events",
            "type": "User",
            "site_admin": false
          },
          "html_url": "https://github.com/arthurgrigoletto/arthurgrigoletto-avantica",
          "description": null,
          "fork": false,
          "url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica",
          "forks_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/forks",
          "keys_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/keys{/key_id}",
          "collaborators_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/collaborators{/collaborator}",
          "teams_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/teams",
          "hooks_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/hooks",
          "issue_events_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/issues/events{/number}",
          "events_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/events",
          "assignees_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/assignees{/user}",
          "branches_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/branches{/branch}",
          "tags_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/tags",
          "blobs_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/git/blobs{/sha}",
          "git_tags_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/git/tags{/sha}",
          "git_refs_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/git/refs{/sha}",
          "trees_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/git/trees{/sha}",
          "statuses_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/statuses/{sha}",
          "languages_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/languages",
          "stargazers_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/stargazers",
          "contributors_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/contributors",
          "subscribers_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/subscribers",
          "subscription_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/subscription",
          "commits_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/commits{/sha}",
          "git_commits_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/git/commits{/sha}",
          "comments_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/comments{/number}",
          "issue_comment_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/issues/comments{/number}",
          "contents_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/contents/{+path}",
          "compare_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/compare/{base}...{head}",
          "merges_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/merges",
          "archive_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/{archive_format}{/ref}",
          "downloads_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/downloads",
          "issues_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/issues{/number}",
          "pulls_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/pulls{/number}",
          "milestones_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/milestones{/number}",
          "notifications_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/notifications{?since,all,participating}",
          "labels_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/labels{/name}",
          "releases_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/releases{/id}",
          "deployments_url": "https://api.github.com/repos/arthurgrigoletto/arthurgrigoletto-avantica/deployments",
          "created_at": "2021-03-17T12:41:34Z",
          "updated_at": "2021-03-17T12:47:04Z",
          "pushed_at": "2021-03-17T12:47:01Z",
          "git_url": "git://github.com/arthurgrigoletto/arthurgrigoletto-avantica.git",
          "ssh_url": "git@github.com:arthurgrigoletto/arthurgrigoletto-avantica.git",
          "clone_url": "https://github.com/arthurgrigoletto/arthurgrigoletto-avantica.git",
          "svn_url": "https://github.com/arthurgrigoletto/arthurgrigoletto-avantica",
          "homepage": null,
          "size": 156,
          "stargazers_count": 0,
          "watchers_count": 0,
          "language": "TypeScript",
          "has_issues": true,
          "has_projects": true,
          "has_downloads": true,
          "has_wiki": true,
          "has_pages": false,
          "forks_count": 0,
          "mirror_url": null,
          "archived": false,
          "disabled": false,
          "open_issues_count": 0,
          "license": null,
          "forks": 0,
          "open_issues": 0,
          "watchers": 0,
          "default_branch": "main"
        }
      ])

      Bypass.expect(bypass, "GET", "users/#{username}/repos", fn conn ->
        conn
        |> Conn.put_resp_header("content-type", "application/json")
        |> Conn.resp(200, body)
      end)

      response = Client.get_user_repos(url, username)

      expected_response =
        {:ok,
         [
           %{
             "description" => nil,
             "html_url" => "https://github.com/arthurgrigoletto/arthurgrigoletto-avantica",
             "id" => 348_705_163,
             "name" => "arthurgrigoletto-avantica",
             "stargazers_count" => 0
           }
         ]}

      assert response == expected_response
    end

    test "should return an error if user not exists", %{bypass: bypass} do
      username = "arthurgrigoletto1324"

      url = endpoint_url(bypass.port)

      body = ~s({
        "message": "Not Found",
        "documentation_url": "https://docs.github.com/rest/reference/repos#list-repositories-for-a-user"
      })

      Bypass.expect(bypass, "GET", "users/#{username}/repos", fn conn ->
        conn
        |> Conn.put_resp_header("content-type", "application/json")
        |> Conn.resp(404, body)
      end)

      response = Client.get_user_repos(url, username)

      expected_response =
        {:error, %GithubExplorer.Error{result: "User not found", status: :not_found}}

      assert response == expected_response
    end
  end
end
