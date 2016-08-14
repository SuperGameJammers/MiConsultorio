defmodule Cielito.PatientTest do
  use Cielito.ModelCase

  alias Cielito.Patient

  @valid_attrs %{age: 42, first_name: "some content", gender: "some content", last_name: "some content", phone: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Patient.changeset(%Patient{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Patient.changeset(%Patient{}, @invalid_attrs)
    refute changeset.valid?
  end
end
