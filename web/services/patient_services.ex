defmodule Cielito.PatientServices do
  use Cielito.Web, :controller
  alias Cielito.{PatientChangesets, Patient}

  def create(phone) do
    changeset = PatientChangesets.phone(%Patient{}, %{"phone" => phone})
    case Repo.insert(changeset) do
      {:ok, patient} ->
        message = "¡Gracias! Ayúdame a registrarte: ¿cuál es tu nombre? Ej. Alejandro Guerra"
        context = [%{name: "registration-step-2", lifespan: 5, parameters: %{phone: patient.phone}}]
        [message, context]
    end
  end

  def update(patient, params) do
    changeset = PatientChangesets.update(patient, params)
    case Repo.update(changeset) do
      {:ok, patient} -> patient
    end
  end
end
