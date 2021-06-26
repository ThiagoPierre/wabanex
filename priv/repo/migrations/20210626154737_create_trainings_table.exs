defmodule Wabanex.Repo.Migrations.CreateTrainingsTable do
  use Ecto.Migration

  def change do
    create table(:trainings) do
      add :start_date, :date
      add :end_date, :date
      add :user_id, references(:users) #referência a outra tabela

      timestamps()
    end
  end
end
