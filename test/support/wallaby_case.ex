defmodule Zolesha.WallabyCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias Zolesha.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import Zolesha.Router.Helpers
      import Zolesha.TestHelpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Zolesha.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Zolesha.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Zolesha.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
