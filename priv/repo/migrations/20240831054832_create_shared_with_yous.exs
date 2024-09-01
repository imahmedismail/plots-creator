defmodule PlotsCreator.Repo.Migrations.SharedUserPlots do
  use Ecto.Migration

  def up do
    create table(:shared_user_plots) do
      add(:shared_by, references(:users, on_delete: :delete_all))
      add(:shared_to, references(:users, on_delete: :delete_all))
      add(:plot_id, references(:your_plots, on_delete: :delete_all))
      add(:shared_at, :utc_datetime)

      timestamps()
    end

    create(index(:shared_user_plots, [:shared_by]))
    create(index(:shared_user_plots, [:shared_to]))
    create(index(:shared_user_plots, [:plot_id]))
  end

  def down do
    drop(table(:shared_user_plots))
  end
end
