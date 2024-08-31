defmodule PlotsCreatorWeb.SharedWithYouLive.Show do
  use PlotsCreatorWeb, :live_view

  alias PlotsCreator.Dashboard

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:shared_with_you, Dashboard.get_shared_with_you!(id))}
  end

  defp page_title(:show), do: "Show Shared with you"
  defp page_title(:edit), do: "Edit Shared with you"
end
