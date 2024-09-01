defmodule PlotsCreatorWeb.SharedWithYouLive.Index do
  use PlotsCreatorWeb, :live_view

  alias PlotsCreator.Dashboard
  alias PlotsCreator.Accounts

  @impl true
  def mount(_params, session, socket) do
    current_user = Accounts.get_user_by_session_token(session["user_token"])
    your_plots = list_your_plots(current_user.id)

    {:ok,
     assign(socket, %{
       shared_with_yous: your_plots,
       current_user: current_user
     })}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Shared with yous")
    |> assign(:shared_with_you, nil)
  end

  defp list_your_plots(user_id) do
    user_id
    |> Dashboard.list_shared_with_yous()
    |> Enum.map(& &1.plot_id)
    |> Enum.uniq()
    |> Dashboard.list_your_plots_by()
  end
end
