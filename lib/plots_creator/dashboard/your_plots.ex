defmodule PlotsCreator.Dashboard.YourPlots do
  use Ecto.Schema
  import Ecto.Changeset

  schema "your_plots" do
    field :name, :string
    field :dataset_name, :string
    field :expression, :string

    belongs_to :user, PlotsCreator.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(your_plots, attrs) do
    your_plots
    |> cast(attrs, [:name, :dataset_name, :expression, :user_id])
    |> validate_required([:name, :dataset_name, :expression, :user_id])
  end
end
