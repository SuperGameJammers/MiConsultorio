defmodule Cielito.PatientServices do
  use Cielito.Web, :controller
  alias Cielito.{PatientChangesets, Patient}

  def create(phone) do
    changeset = PatientChangesets.phone(%Patient{}, %{"phone" => phone})
    case Repo.insert(changeset) do
      {:ok, patient} ->
        message = "¡Gracias! Ayúdame a registrarte: ¿cuál es tu nombre? Ej. Alejandro"
        context = [%{name: "registration-step-2", lifespan: 5, parameters: %{phone: patient.phone}}]
        [message, context]
    end
  end
end
