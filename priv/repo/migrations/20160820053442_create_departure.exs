defmodule MbtaWeb.Repo.Migrations.CreateDeparture do
  use Ecto.Migration

  def change do
    create table(:departures) do
      add :timestamp, :integer
      add :origin, :string
      add :trip, :string
      add :destination, :string
      add :scheduled_time, :integer
      add :lateness, :integer
      add :track, :string
      add :status, :string

      timestamps()
    end

  end
end
