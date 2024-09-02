defmodule PlotsCreatorWeb.SharedWithYouLiveTest do
  use PlotsCreatorWeb.ConnCase

  import PlotsCreator.DashboardFixtures

  setup :register_and_log_in_user

  defp create_shared_with_you(_) do
    shared_with_you = shared_with_you_fixture()
    %{shared_with_you: shared_with_you}
  end

  describe "Index" do
    setup [:create_shared_with_you]

    test "renders the index page", %{conn: conn} do
      conn = get(conn, Routes.shared_with_you_index_path(conn, :index))
      assert html_response(conn, 200) =~ "Shared Plots"
    end
  end

  describe "Show" do
    setup [:create_shared_with_you]

    test "renders the show page", %{conn: conn} do
      conn = get(conn, Routes.shared_with_you_index_path(conn, :index))
      assert html_response(conn, 200) =~ "Shared Plots"
    end
  end
end
