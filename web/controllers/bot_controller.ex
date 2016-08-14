defmodule Cielito.BotController do
  use Cielito.Web, :controller
  alias Cielito.{BotServices, PatientChangesets, Patient, PatientServices}

  def answer(conn, %{"result" => %{"parameters" => %{"appointment" => "cita"}}}) do
    message = "Tengo disponibles los días ..."
    context = [%{name: "scheduling", lifespan: 5, parameters: %{}}]
    render(conn, "available_dates.json", message: message, context: context)
  end

  def answer(conn, %{"result" => %{"parameters" => %{"number" => number, "phone-number" => phone_number}}}) do
    phone = BotServices.number_normalizer(number, phone_number)
    patient = Repo.get_by(Patient, phone: phone)
    case patient do
      # Here we enter the registration phase because
      # there's no user with the provided phone
      nil ->
        [message, context] = PatientServices.create(phone)
        render(conn, "registration_step_2.json", message: message, context: context)
      # Otherwise, we enter the scheduling phase and welcome back the user
      _ ->
        message = "¡Hola de nuevo, #{patient.first_name}! ¿En qué te puedo ayudar?"
        context = [%{name: "scheduling", lifespan: 5, parameters: %{}}]
        render(conn, "welcome_back.json", message: message, context: context)
    end
  end
end
