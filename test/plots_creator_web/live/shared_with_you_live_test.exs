defmodule PlotsCreatorWeb.SharedWithYouLiveTest do
  use PlotsCreatorWeb.ConnCase

  import Phoenix.LiveViewTest
  import PlotsCreator.DashboardFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_shared_with_you(_) do
    shared_with_you = shared_with_you_fixture()
    %{shared_with_you: shared_with_you}
  end

  describe "Index" do
    setup [:create_shared_with_you]

    test "lists all shared_with_yous", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.shared_with_you_index_path(conn, :index))

      assert html =~ "Listing Shared with yous"
    end

    test "saves new shared_with_you", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.shared_with_you_index_path(conn, :index))

      assert index_live |> element("a", "New Shared with you") |> render_click() =~
               "New Shared with you"

      assert_patch(index_live, Routes.shared_with_you_index_path(conn, :new))

      assert index_live
             |> form("#shared_with_you-form", shared_with_you: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#shared_with_you-form", shared_with_you: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.shared_with_you_index_path(conn, :index))

      assert html =~ "Shared with you created successfully"
    end

    test "updates shared_with_you in listing", %{conn: conn, shared_with_you: shared_with_you} do
      {:ok, index_live, _html} = live(conn, Routes.shared_with_you_index_path(conn, :index))

      assert index_live |> element("#shared_with_you-#{shared_with_you.id} a", "Edit") |> render_click() =~
               "Edit Shared with you"

      assert_patch(index_live, Routes.shared_with_you_index_path(conn, :edit, shared_with_you))

      assert index_live
             |> form("#shared_with_you-form", shared_with_you: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#shared_with_you-form", shared_with_you: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.shared_with_you_index_path(conn, :index))

      assert html =~ "Shared with you updated successfully"
    end

    test "deletes shared_with_you in listing", %{conn: conn, shared_with_you: shared_with_you} do
      {:ok, index_live, _html} = live(conn, Routes.shared_with_you_index_path(conn, :index))

      assert index_live |> element("#shared_with_you-#{shared_with_you.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#shared_with_you-#{shared_with_you.id}")
    end
  end

  describe "Show" do
    setup [:create_shared_with_you]

    test "displays shared_with_you", %{conn: conn, shared_with_you: shared_with_you} do
      {:ok, _show_live, html} = live(conn, Routes.shared_with_you_show_path(conn, :show, shared_with_you))

      assert html =~ "Show Shared with you"
    end

    test "updates shared_with_you within modal", %{conn: conn, shared_with_you: shared_with_you} do
      {:ok, show_live, _html} = live(conn, Routes.shared_with_you_show_path(conn, :show, shared_with_you))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Shared with you"

      assert_patch(show_live, Routes.shared_with_you_show_path(conn, :edit, shared_with_you))

      assert show_live
             |> form("#shared_with_you-form", shared_with_you: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#shared_with_you-form", shared_with_you: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.shared_with_you_show_path(conn, :show, shared_with_you))

      assert html =~ "Shared with you updated successfully"
    end
  end
end
