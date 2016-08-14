defmodule Cielito.Router do
  use Cielito.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Cielito do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", Cielito do
    pipe_through :api

    post "/doctorbot", BotController, :answer

    resources "/patients", PatientController, except: [:new, :edit]
  end
end
