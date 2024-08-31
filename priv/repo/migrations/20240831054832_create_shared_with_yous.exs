defmodule PlotsCreator.Repo.Migrations.SharedUserPlots do
  use Ecto.Migration

  def change do
    create table(:shared_user_plots) do
      add(:user_id, references(:users, on_delete: :delete_all))
      add(:plot_id, references(:plots, on_delete: :delete_all))
      add(:shared_at, :utc_datetime)

      timestamps()
    end
  end
end
