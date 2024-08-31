defmodule PlotsCreatorWeb.PageController do
  use PlotsCreatorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
