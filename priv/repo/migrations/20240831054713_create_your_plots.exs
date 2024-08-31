defmodule PlotsCreator.Repo.Migrations.CreateYourPlots do
  use Ecto.Migration

  def change do
    create table(:your_plots) do
      timestamps()
    end
  end
end
