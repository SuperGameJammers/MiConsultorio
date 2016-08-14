defmodule Cielito.PatientChangesets do
  use Cielito.Web, :model

  def phone(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :phone, :gender, :age])
    |> validate_required([:phone])
  end

  def update(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :phone, :gender, :age])
    |> validate_required([:phone])
  end
end
