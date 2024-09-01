defmodule PlotsCreator.Dashboard.SharedWithYou do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shared_user_plots" do
    belongs_to :shared_by_user, PlotsCreator.Accounts.User,
      foreign_key: :shared_by

    belongs_to :shared_to_user, PlotsCreator.Accounts.User,
      foreign_key: :shared_to

    belongs_to :your_plots, PlotsCreator.Dashboard.YourPlots,
      foreign_key: :plot_id

    field :shared_at, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(shared_with_you, attrs) do
    attrs = Map.put(attrs, "shared_at", DateTime.utc_now())

    shared_with_you
    |> cast(attrs, [:shared_by, :shared_to, :plot_id, :shared_at])
    |> validate_required([:shared_by, :shared_to, :plot_id, :shared_at])
  end
end
