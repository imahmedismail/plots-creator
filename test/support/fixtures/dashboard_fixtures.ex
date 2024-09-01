defmodule PlotsCreator.DashboardFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PlotsCreator.Dashboard` context.
  """
  alias PlotsCreator.AccountsFixtures
  @doc """
  Generate a your_plots.
  """
  def your_plots_fixture(attrs \\ %{}) do
    user_id = AccountsFixtures.user_fixture().id

    {:ok, your_plots} =
      attrs
      |> Enum.into(%{
        name: "Your plots",
        dataset_name: "Dataset name",
        expression: "Expression",
        user_id: user_id
      })
      |> PlotsCreator.Dashboard.create_your_plots()

    your_plots
  end

  @doc """
  Generate a shared_with_you.
  """
  def shared_with_you_fixture(attrs \\ %{}) do
    {:ok, shared_with_you} =
      attrs
      |> Enum.into(%{
        "shared_by" => AccountsFixtures.user_fixture().id,
        "shared_to" => AccountsFixtures.user_fixture().id,
        "plot_id" => your_plots_fixture().id
      })
      |> PlotsCreator.Dashboard.create_shared_with_you()

    shared_with_you
  end
end
