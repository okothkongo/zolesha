defmodule ZoleshaWeb.PageController do
  use ZoleshaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
