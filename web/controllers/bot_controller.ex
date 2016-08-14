defmodule Cielito.BotController do
  use Cielito.Web, :controller

  def test(conn, %{"result" => %{"parameters" => %{"appointment" => "cita"}}}) do
    render(conn, "available_dates.json")
  end
end
