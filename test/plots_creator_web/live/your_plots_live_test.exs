defmodule PlotsCreatorWeb.YourPlotsLiveTest do
  use PlotsCreatorWeb.ConnCase

  import Phoenix.LiveViewTest
  import PlotsCreator.DashboardFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_your_plots(_) do
    your_plots = your_plots_fixture()
    %{your_plots: your_plots}
  end

  describe "Index" do
    setup [:create_your_plots]

    test "lists all your_plots", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.your_plots_index_path(conn, :index))

      assert html =~ "Listing Your plots"
    end

    test "saves new your_plots", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.your_plots_index_path(conn, :index))

      assert index_live |> element("a", "New Your plots") |> render_click() =~
               "New Your plots"

      assert_patch(index_live, Routes.your_plots_index_path(conn, :new))

      assert index_live
             |> form("#your_plots-form", your_plots: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#your_plots-form", your_plots: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.your_plots_index_path(conn, :index))

      assert html =~ "Your plots created successfully"
    end

    test "updates your_plots in listing", %{conn: conn, your_plots: your_plots} do
      {:ok, index_live, _html} = live(conn, Routes.your_plots_index_path(conn, :index))

      assert index_live |> element("#your_plots-#{your_plots.id} a", "Edit") |> render_click() =~
               "Edit Your plots"

      assert_patch(index_live, Routes.your_plots_index_path(conn, :edit, your_plots))

      assert index_live
             |> form("#your_plots-form", your_plots: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#your_plots-form", your_plots: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.your_plots_index_path(conn, :index))

      assert html =~ "Your plots updated successfully"
    end

    test "deletes your_plots in listing", %{conn: conn, your_plots: your_plots} do
      {:ok, index_live, _html} = live(conn, Routes.your_plots_index_path(conn, :index))

      assert index_live |> element("#your_plots-#{your_plots.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#your_plots-#{your_plots.id}")
    end
  end

  describe "Show" do
    setup [:create_your_plots]

    test "displays your_plots", %{conn: conn, your_plots: your_plots} do
      {:ok, _show_live, html} = live(conn, Routes.your_plots_show_path(conn, :show, your_plots))

      assert html =~ "Show Your plots"
    end

    test "updates your_plots within modal", %{conn: conn, your_plots: your_plots} do
      {:ok, show_live, _html} = live(conn, Routes.your_plots_show_path(conn, :show, your_plots))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Your plots"

      assert_patch(show_live, Routes.your_plots_show_path(conn, :edit, your_plots))

      assert show_live
             |> form("#your_plots-form", your_plots: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#your_plots-form", your_plots: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.your_plots_show_path(conn, :show, your_plots))

      assert html =~ "Your plots updated successfully"
    end
  end
end
