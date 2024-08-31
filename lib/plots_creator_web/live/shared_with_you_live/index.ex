defmodule PlotsCreatorWeb.SharedWithYouLive.Index do
  use PlotsCreatorWeb, :live_view

  alias PlotsCreator.Dashboard
  alias PlotsCreator.Dashboard.SharedWithYou
  alias PlotsCreator.Accounts

  @impl true
  def mount(_params, session, socket) do
    current_user = Accounts.get_user_by_session_token(session["user_token"])

    {:ok,
     assign(socket, %{
       shared_with_yous: list_shared_with_yous(),
       current_user: current_user
     })}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Shared with you")
    |> assign(:shared_with_you, Dashboard.get_shared_with_you!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Shared with you")
    |> assign(:shared_with_you, %SharedWithYou{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Shared with yous")
    |> assign(:shared_with_you, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    shared_with_you = Dashboard.get_shared_with_you!(id)
    {:ok, _} = Dashboard.delete_shared_with_you(shared_with_you)

    {:noreply, assign(socket, :shared_with_yous, list_shared_with_yous())}
  end

  defp list_shared_with_yous do
    Dashboard.list_shared_with_yous()
  end
end
