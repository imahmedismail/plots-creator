defmodule PlotsCreator.Dashboard.SharedWithYou do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shared_with_yous" do
    timestamps()
  end

  @doc false
  def changeset(shared_with_you, attrs) do
    shared_with_you
    |> cast(attrs, [])
    |> validate_required([])
  end
end
