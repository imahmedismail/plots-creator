defmodule PlotsCreatorWeb.YourPlotsLive.Index do
  alias PlotsCreator.Accounts
  use PlotsCreatorWeb, :live_view

  alias PlotsCreator.Dashboard
  alias PlotsCreator.Dashboard.YourPlots

  @impl true
  def mount(_params, session, socket) do
    current_user = Accounts.get_user_by_session_token(session["user_token"])

    {:ok,
     assign(socket, %{
       your_plots_collection: list_your_plots(),
       current_user: current_user
     })}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Your plots")
    |> assign(:your_plots, Dashboard.get_your_plots!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Your plots")
    |> assign(:your_plots, %YourPlots{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Your plots")
    |> assign(:your_plots, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    your_plots = Dashboard.get_your_plots!(id)
    {:ok, _} = Dashboard.delete_your_plots(your_plots)

    {:noreply, assign(socket, :your_plots_collection, list_your_plots())}
  end

  defp list_your_plots do
    Dashboard.list_your_plots()
  end
end
