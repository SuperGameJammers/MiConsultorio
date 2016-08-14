defmodule Cielito.BotView do
  use Cielito.Web, :view

  def render("available_dates.json", _) do
    render_one([], Cielito.BotView, "answer.json")
  end

  def render("answer.json", _) do
    %{
      speech: "Tengo disponibles los días ...",
      displayText: "Tengo disponibles los días ..."
    }
  end
end
