defmodule PlotsCreatorWeb.YourPlotsLiveTest do
  use PlotsCreatorWeb.ConnCase

  import PlotsCreator.DashboardFixtures

  setup :register_and_log_in_user

  defp create_your_plots(_) do
    your_plots = your_plots_fixture()
    %{your_plots: your_plots}
  end

  describe "Index" do
    setup [:create_your_plots]

    test "renders the index page", %{conn: conn} do
      conn = get(conn, Routes.your_plots_index_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Your Plots"
    end
  end

  describe "Describe Show" do
    setup [:create_your_plots]

    test "renders the show page", %{conn: conn} do
      conn = get(conn, Routes.your_plots_index_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Your Plots"
    end
  end
end
