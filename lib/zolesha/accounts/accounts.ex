defmodule Zolesha.Accounts do
  @moduledoc """
  The crud or any operation to be done any existing user account is done here,the sole purpose of this module is
  to act as interface on interaction with database.
  """
  alias Zolesha.Accounts.Admin
  alias Zolesha.Repo

  @doc """
  Create admin give the attributes which are inform of map, return {:ok, %Admin{}} incase of success or
  {:error, %Ecto.changeset{}} incase of failure.
  """
  def create_admin(attrs) do
    %Admin{}
    |> Admin.changeset(attrs)
    |> Repo.insert()
    |> IO.inspect()
  end
end
