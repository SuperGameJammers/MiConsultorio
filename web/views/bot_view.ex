defmodule Cielito.BotView do
  use Cielito.Web, :view

  def render("available_dates.json", %{message: message, context: context}) do
    render_one(%{}, Cielito.BotView, "answer.json", message: message, context: context)
  end

  def render("registration_step_2.json", %{message: message, context: context}) do
    render_one(%{}, Cielito.BotView, "answer.json", message: message, context: context)
  end

  def render("welcome_back.json", %{message: message, context: context}) do
    render_one(%{}, Cielito.BotView, "answer.json", message: message, context: context)
  end

  def render("answer.json", %{message: message, context: context}) do
    %{
      speech: message,
      displayText: message,
      contextOut: context,
      source: "elixir-backend"
    }
  end
end
