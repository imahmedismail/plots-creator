defmodule PlotsCreator.DashboardFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PlotsCreator.Dashboard` context.
  """

  @doc """
  Generate a your_plots.
  """
  def your_plots_fixture(attrs \\ %{}) do
    {:ok, your_plots} =
      attrs
      |> Enum.into(%{

      })
      |> PlotsCreator.Dashboard.create_your_plots()

    your_plots
  end
end
