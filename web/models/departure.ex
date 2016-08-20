defmodule MbtaWeb.Departure do
  use MbtaWeb.Web, :model

  schema "departures" do
    field :timestamp, :integer
    field :origin, :string
    field :trip, :string
    field :destination, :string
    field :scheduled_time, :integer
    field :lateness, :integer
    field :track, :string
    field :status, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:timestamp, :origin, :trip, :destination, :scheduled_time, :lateness, :track, :status])
    |> validate_required([:timestamp, :origin, :trip, :destination, :scheduled_time, :lateness, :track, :status])
  end
end
