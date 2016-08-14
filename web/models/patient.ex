defmodule Cielito.Patient do
  use Cielito.Web, :model

  schema "patients" do
    field :first_name, :string
    field :last_name, :string
    field :phone, :string
    field :gender, :string
    field :age, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :phone, :gender, :age])
    |> validate_required([:first_name, :last_name, :phone, :gender, :age])
  end
end
