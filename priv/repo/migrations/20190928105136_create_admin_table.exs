defmodule Zolesha.Repo.Migrations.CreateAdminTable do
  @moduledoc """
  This module represent the actually reflection of Admin relation as it is actually respresent in the database.
  It show current database state.
  """
  use Ecto.Migration

  def change do
    create table(:admins) do
      add :email, :string, null: false
      add :password_hash, :string, null: false
      timestamps()
    end

    create(unique_index(:admins, [:email]))
  end
end
