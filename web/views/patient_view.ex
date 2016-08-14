defmodule Cielito.PatientView do
  use Cielito.Web, :view

  def render("index.json", %{patients: patients}) do
    %{data: render_many(patients, Cielito.PatientView, "patient.json")}
  end

  def render("show.json", %{patient: patient}) do
    %{data: render_one(patient, Cielito.PatientView, "patient.json")}
  end

  def render("patient.json", %{patient: patient}) do
    %{id: patient.id,
      first_name: patient.first_name,
      last_name: patient.last_name,
      phone: patient.phone,
      gender: patient.gender,
      age: patient.age}
  end
end
