defmodule PlotsCreatorWeb.YourPlotsLive.Show do
  use PlotsCreatorWeb, :live_view

  alias PlotsCreator.Dashboard
  alias PlotsCreator.Accounts

  @impl true
  def mount(_params, session, socket) do
    current_user = Accounts.get_user_by_session_token(session["user_token"])
    {:ok, socket |> assign(:current_user, current_user)}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:your_plots, Dashboard.get_your_plots!(id))}
  end

  defp page_title(:show), do: "Show Your plots"
  defp page_title(:edit), do: "Edit Your plots"
end
