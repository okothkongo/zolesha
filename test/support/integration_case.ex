defmodule Zolesha.IntegrationCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  using do
    quote do
      use Zolesha.ConnCase
      use PhoenixIntegration
    end
  end
end
