defmodule PlotsCreatorWeb.PageControllerTest do
  use PlotsCreatorWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 302) =~ "<html><body>You are being <a href=\"/users/register\">redirected</a>.</body></html>"
  end
end
