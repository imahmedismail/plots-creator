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

  describe "shared_with_yous" do
    alias PlotsCreator.Dashboard.SharedWithYou

    import PlotsCreator.DashboardFixtures

    @invalid_attrs %{}

    test "list_shared_with_yous/0 returns all shared_with_yous" do
      shared_with_you = shared_with_you_fixture()
      assert Dashboard.list_shared_with_yous() == [shared_with_you]
    end

    test "get_shared_with_you!/1 returns the shared_with_you with given id" do
      shared_with_you = shared_with_you_fixture()
      assert Dashboard.get_shared_with_you!(shared_with_you.id) == shared_with_you
    end

    test "create_shared_with_you/1 with valid data creates a shared_with_you" do
      valid_attrs = %{}

      assert {:ok, %SharedWithYou{} = shared_with_you} = Dashboard.create_shared_with_you(valid_attrs)
    end

    test "create_shared_with_you/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dashboard.create_shared_with_you(@invalid_attrs)
    end

    test "update_shared_with_you/2 with valid data updates the shared_with_you" do
      shared_with_you = shared_with_you_fixture()
      update_attrs = %{}

      assert {:ok, %SharedWithYou{} = shared_with_you} = Dashboard.update_shared_with_you(shared_with_you, update_attrs)
    end

    test "update_shared_with_you/2 with invalid data returns error changeset" do
      shared_with_you = shared_with_you_fixture()
      assert {:error, %Ecto.Changeset{}} = Dashboard.update_shared_with_you(shared_with_you, @invalid_attrs)
      assert shared_with_you == Dashboard.get_shared_with_you!(shared_with_you.id)
    end

    test "delete_shared_with_you/1 deletes the shared_with_you" do
      shared_with_you = shared_with_you_fixture()
      assert {:ok, %SharedWithYou{}} = Dashboard.delete_shared_with_you(shared_with_you)
      assert_raise Ecto.NoResultsError, fn -> Dashboard.get_shared_with_you!(shared_with_you.id) end
    end

    test "change_shared_with_you/1 returns a shared_with_you changeset" do
      shared_with_you = shared_with_you_fixture()
      assert %Ecto.Changeset{} = Dashboard.change_shared_with_you(shared_with_you)
    end
  end
end
