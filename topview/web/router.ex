defmodule Topview.Router do
  use Topview.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Topview do
    pipe_through :api

    resources "/users", UserController, only: [:index, :show, :create]
  end
end
