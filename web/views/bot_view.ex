defmodule Cielito.BotView do
  use Cielito.Web, :view

  def render("test.json", _) do
    render_one([], Cielito.BotView, "answer.json")
  end

  def render("answer.json", _) do
    %{
      speech: "olo lince waddup",
      source: "apiai-weather-webhook-sample",
      displayText: "mc morris is in da houze"
    }
  end
end
