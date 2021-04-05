defmodule GithubExplorerWeb.Auth.Guardian do
  use Guardian, otp_app: :github_explorer

  alias GithubExplorer.{Error, User}
  alias GithubExplorer.Users.Get, as: UserGet

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(claims) do
    claims
    |> Map.get("sub")
    |> UserGet.by_id()
  end

  def authenticate(%{"id" => user_id, "password" => password}) do
    with {:ok, %User{password_hash: password_hash} = user} <- UserGet.by_id(user_id),
         true <- Pbkdf2.verify_pass(password, password_hash),
         {:ok, token, _claims} <- encode_and_sign(user) do
      {:ok, token}
    else
      false -> {:error, Error.build(:unauthorized, "Please verify your credentials")}
      error -> error
    end
  end

  def authenticate(_), do: {:error, Error.build(:bad_request, "Invalid or missing params")}
end