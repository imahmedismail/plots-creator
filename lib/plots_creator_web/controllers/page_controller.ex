defmodule PlotsCreatorWeb.PageController do
  use PlotsCreatorWeb, :controller

  def index(conn, _params) do
    redirect(conn, to: Routes.user_registration_path(conn, :new))
  end
end
