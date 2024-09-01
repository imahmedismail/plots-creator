defmodule PlotsCreatorWeb.SharedWithYouLiveTest do
  use PlotsCreatorWeb.ConnCase

  import PlotsCreator.DashboardFixtures

  defp create_shared_with_you(_) do
    shared_with_you = shared_with_you_fixture()
    %{shared_with_you: shared_with_you}
  end

  describe "Index" do
    setup [:create_shared_with_you]
  end

  describe "Show" do
    setup [:create_shared_with_you]
  end
end
