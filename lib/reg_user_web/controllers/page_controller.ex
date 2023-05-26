defmodule RegUserWeb.PageController do
  use RegUserWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
