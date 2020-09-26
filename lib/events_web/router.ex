defmodule EventsWeb.Router do
  use EventsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EventsWeb do
    pipe_through :api

    get "/", IndexController, :index
  end

  scope "/api", EventsWeb do
    pipe_through :api

    scope "/admin/event" do
      get "/", AdminController, :index

      post "/add", AdminController, :create
      put "/update/:id", AdminController, :update
      delete "/delete/:id", AdminController, :delete

      get "/counts", AdminController, :rsvp_counts
      get "/cancelled-counts", AdminController, :cancelled_counts

      get "/counts/:event_id", AdminController, :rsvp_event_counts
      get "/cancelled-counts/:event_id", AdminController, :cancelled_event_counts
    end

    scope "/v1/event" do
      get "/", UserController, :index
      get "/list", UserController, :events

      post "/add", UserController, :attend

      put "/cancel", UserController, :cancel
    end
  end
end
