defmodule PlotsCreatorWeb.UserRegistrationControllerTest do
  use PlotsCreatorWeb.ConnCase, async: true

  import PlotsCreator.AccountsFixtures

  describe "GET /users/register" do
    test "renders registration page", %{conn: conn} do
      conn = get(conn, Routes.user_registration_path(conn, :new))
      response = html_response(conn, 200)
      assert response =~ "Register</h1>"
      assert response =~ "Log in</a>"
      assert response =~ "Register</a>"
    end

    test "redirects if already logged in", %{conn: conn} do
      conn =
        conn
        |> log_in_user(user_fixture())
        |> get(Routes.user_registration_path(conn, :new))

      assert redirected_to(conn) == "/your_plots"
    end
  end

  describe "POST /users/register" do
    @tag :capture_log
    test "creates account and logs the user in", %{conn: conn} do
      email = unique_user_email()

      conn =
        post(conn, Routes.user_registration_path(conn, :create), %{
          "user" => valid_user_attributes(email: email)
        })

      assert get_session(conn, :user_token)
      assert redirected_to(conn) == "/your_plots"

      # Now do a logged in request and assert on the menu
      conn = get(conn, "/")
      response = html_response(conn, 302)

      assert response =~
               "<html><body>You are being <a href=\"/your_plots\">redirected</a>.</body></html>"
    end

    test "render errors for invalid data", %{conn: conn} do
      conn =
        post(conn, Routes.user_registration_path(conn, :create), %{
          "user" => %{"email" => "with spaces", "password" => "too short"}
        })

      response = html_response(conn, 200)
      assert response =~ "Register</h1>"
      assert response =~ "must have the @ sign and no spaces"
      assert response =~ "should be at least 12 character"
    end
  end
end
