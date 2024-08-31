defmodule PlotsCreator.Dashboard.YourPlots do
  use Ecto.Schema
  import Ecto.Changeset

  schema "your_plots" do
    timestamps()
  end

  @doc false
  def changeset(your_plots, attrs) do
    your_plots
    |> cast(attrs, [])
    |> validate_required([])
  end
end
