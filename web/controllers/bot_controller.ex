defmodule Cielito.BotController do
  use Cielito.Web, :controller
  alias Cielito.{BotServices, PatientChangesets, Patient, PatientServices}

  def answer(conn, %{"result" => %{"parameters" => %{"appointment" => "cita"}}}) do
    message = "Escríbele a mi asistente @drmorrisagenda para agendar tu cita. ¡Espero verte pronto en consulta!"
    context = [%{name: "scheduling", lifespan: 5, parameters: %{}}]
    render(conn, "available_dates.json", message: message, context: context)
  end

  def answer(conn, %{"result" => %{"contexts" => [%{"parameters" => %{"given-name.original" => name, "phone" => phone}}|_]}}) do
    patient = Repo.get_by(Patient, phone: phone)
    case patient do
      nil ->
        [message, context] = PatientServices.create(phone)
        render(conn, "registration_step_2.json", message: message, context: context)
      _ ->
        IO.puts name
        [first_name, last_name | _] = String.split(name, " ")
        patient = PatientServices.update(patient, %{first_name: first_name, last_name: last_name})
        message = "¡Gracias, #{patient.first_name}! Para agendar una cita, por favor escríbele a mi asistente @drmorrisagenda. ¡Nos vemos pronto en consulta!"
        context = [%{name: "registration_step_3", lifespan: 5, parameters: %{phone: patient.phone}}]
        render(conn, "answer.json", message: message, context: context)
    end
  end

  def answer(conn, %{"result" => %{"parameters" => %{"number" => number, "phone" => phone_number}}}) do
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
