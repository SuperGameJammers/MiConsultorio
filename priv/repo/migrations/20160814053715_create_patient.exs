defmodule Cielito.Repo.Migrations.CreatePatient do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :first_name, :string
      add :last_name, :string
      add :phone, :string
      add :gender, :string
      add :age, :integer

      timestamps()
    end

  end
end
