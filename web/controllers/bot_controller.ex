defmodule Cielito.BotController do
  use Cielito.Web, :controller

  def test(conn, params) do
    render(conn, "test.json")
  end
end
