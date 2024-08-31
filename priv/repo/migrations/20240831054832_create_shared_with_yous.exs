defmodule PlotsCreator.Repo.Migrations.CreateSharedWithYous do
  use Ecto.Migration

  def change do
    create table(:shared_with_yous) do
      timestamps()
    end
  end
end
