# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Zolesha.Repo.insert!(%Zolesha.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Zolesha.Accounts
alias Zolesha.Accounts.Admin
alias Zolesha.Repo

unless Repo.get_by(Admin, email: "janedoe@gmail.com") do
  Accounts.create_admin(%{"email" => "janedoe@gmail.com", "password" => "fv4Q+849+ae!W"})
end
