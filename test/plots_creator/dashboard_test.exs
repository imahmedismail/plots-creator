defmodule PlotsCreator.DashboardTest do
  use PlotsCreator.DataCase

  alias PlotsCreator.Dashboard

  describe "your_plots" do
    alias PlotsCreator.Dashboard.YourPlots

    import PlotsCreator.DashboardFixtures

    @invalid_attrs %{}

    test "list_your_plots/0 returns all your_plots" do
      your_plots = your_plots_fixture()
      assert Dashboard.list_your_plots() == [your_plots]
    end

    test "get_your_plots!/1 returns the your_plots with given id" do
      your_plots = your_plots_fixture()
      assert Dashboard.get_your_plots!(your_plots.id) == your_plots
    end

    test "create_your_plots/1 with valid data creates a your_plots" do
      valid_attrs = %{}

      assert {:ok, %YourPlots{} = your_plots} = Dashboard.create_your_plots(valid_attrs)
    end

    test "create_your_plots/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dashboard.create_your_plots(@invalid_attrs)
    end

    test "update_your_plots/2 with valid data updates the your_plots" do
      your_plots = your_plots_fixture()
      update_attrs = %{}

      assert {:ok, %YourPlots{} = your_plots} = Dashboard.update_your_plots(your_plots, update_attrs)
    end

    test "update_your_plots/2 with invalid data returns error changeset" do
      your_plots = your_plots_fixture()
      assert {:error, %Ecto.Changeset{}} = Dashboard.update_your_plots(your_plots, @invalid_attrs)
      assert your_plots == Dashboard.get_your_plots!(your_plots.id)
    end

    test "delete_your_plots/1 deletes the your_plots" do
      your_plots = your_plots_fixture()
      assert {:ok, %YourPlots{}} = Dashboard.delete_your_plots(your_plots)
      assert_raise Ecto.NoResultsError, fn -> Dashboard.get_your_plots!(your_plots.id) end
    end

    test "change_your_plots/1 returns a your_plots changeset" do
      your_plots = your_plots_fixture()
      assert %Ecto.Changeset{} = Dashboard.change_your_plots(your_plots)
    end
  end
end
