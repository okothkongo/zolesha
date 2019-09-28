defmodule Zolesha.Accounts.Admin do
  @moduledoc """
  This module tranforms external admin data into internal representation of the application, for instance password may come
  raw but it not actually saved the hashed version is what is persisted into the database.
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema("admins") do
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    timestamps()
  end

  def changeset(admin, attrs \\ %{}) do
    admin
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
