defmodule Zolesha.AdminTest do
  @moduledoc """
  This is where test which are specific to certain function which deals with admin are kept, kindly note
  that these tests should only involve single operation,if the test involve more than one function move them
  to integration test module of the Admin
  """
  use Zolesha.DataCase
  alias Zolesha.Accounts

  setup do
    valid_attrs = %{"email" => "janedoe@gmail.com", "password" => "Es?U_#%SgY8t*5S#ky+4"}
    [valid_attrs: valid_attrs]
  end

  test "create_admin/1 creates admin with valid atributes", %{valid_attrs: valid_attrs} do
    assert {:ok, %{email: email}} = Accounts.create_admin(valid_attrs)

    assert email == "janedoe@gmail.com"
  end

  test "unsucessful create_admin/1 invalid attrs" do
    assert {:error, changeset} = Accounts.create_admin(%{})
    assert %{email: ["can't be blank"]} = errors_on(changeset)
  end

  test "admin with invalid email pattern not registered" do
    assert {:error, changeset} =
             Accounts.create_admin(%{"email" => "jan@.@com", "password" => "Es?U_#%SgY8t*5S#ky+4"})

    assert %{email: ["has invalid format"]} = errors_on(changeset)
  end

  test "admin with invalid password pattern not registered" do
    assert {:error, changeset} =
             Accounts.create_admin(%{"email" => "janedoe@gmail.com", "password" => "111114wwwww"})

    assert %{password: ["has invalid format"]} = errors_on(changeset)
  end
end
