defmodule VikuluWeb.Router do
  use VikuluWeb, :router

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

  scope "/", VikuluWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get("/api/v1/status", StatusController, :show)
  end

  # Other scopes may use custom stacks.
  # scope "/api", VikuluWeb do
  #   pipe_through :api
  # end
end
