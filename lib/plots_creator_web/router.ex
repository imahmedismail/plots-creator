defmodule PlotsCreatorWeb.Router do
  use PlotsCreatorWeb, :router

  import PlotsCreatorWeb.UserAuth
  import PlotsCreatorWeb.Plugs.CurrentUser, only: [assign_current_user: 2]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PlotsCreatorWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
    plug :assign_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PlotsCreatorWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", PlotsCreatorWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PlotsCreatorWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", PlotsCreatorWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/users/register", UserRegistrationController, :new
    post "/users/register", UserRegistrationController, :create
    get "/users/log_in", UserSessionController, :new
    post "/users/log_in", UserSessionController, :create
    get "/users/reset_password", UserResetPasswordController, :new
    post "/users/reset_password", UserResetPasswordController, :create
    get "/users/reset_password/:token", UserResetPasswordController, :edit
    put "/users/reset_password/:token", UserResetPasswordController, :update
  end

  scope "/", PlotsCreatorWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/users/settings", UserSettingsController, :edit
    put "/users/settings", UserSettingsController, :update

    get "/users/settings/confirm_email/:token",
        UserSettingsController,
        :confirm_email

    live "/your_plots", YourPlotsLive.Index, :index
    live "/your_plots/new", YourPlotsLive.Index, :new
    live "/your_plots/:id/edit", YourPlotsLive.Index, :edit
    live "/your_plots/:id", YourPlotsLive.Show, :show
    live "/your_plots/:id/show/edit", YourPlotsLive.Show, :edit

    live "/shared_with_yous", SharedWithYouLive.Index, :index
    live "/shared_with_yous/new", SharedWithYouLive.Index, :new
    live "/shared_with_yous/:id/edit", SharedWithYouLive.Index, :edit
    live "/shared_with_yous/:id", SharedWithYouLive.Show, :show
    live "/shared_with_yous/:id/show/edit", SharedWithYouLive.Show, :edit
  end

  scope "/", PlotsCreatorWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete
    get "/users/confirm", UserConfirmationController, :new
    post "/users/confirm", UserConfirmationController, :create
    get "/users/confirm/:token", UserConfirmationController, :edit
    post "/users/confirm/:token", UserConfirmationController, :update
  end
end
