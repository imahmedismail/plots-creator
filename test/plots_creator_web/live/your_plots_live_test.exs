defmodule PlotsCreatorWeb.YourPlotsLiveTest do
  use PlotsCreatorWeb.ConnCase

  import PlotsCreator.DashboardFixtures

  defp create_your_plots(_) do
    your_plots = your_plots_fixture()
    %{your_plots: your_plots}
  end

  describe "Index" do
    setup [:create_your_plots]
  end

  describe "Show" do
    setup [:create_your_plots]
  end
end
