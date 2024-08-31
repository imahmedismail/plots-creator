defmodule PlotsCreator.Repo.Migrations.CreateYourPlots do
  use Ecto.Migration

  def up do
    create table(:your_plots) do
      add(:name, :string)
      add(:dataset_name, :string)
      add(:expression, :string)

      timestamps()
    end

    create(unique_index(:your_plots, [:name]))
    create(index(:your_plots, [:dataset_name]))
  end

  def down do
    drop(table(:your_plots))
  end
end
