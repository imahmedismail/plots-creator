defmodule PlotsCreatorWeb.YourPlotsLive.Show do
  use PlotsCreatorWeb, :live_view

  alias PlotsCreator.Dashboard
  alias PlotsCreator.Accounts
  alias PlotsCreator.GitHubClient

  @impl true
  def mount(_params, session, socket) do
    current_user = Accounts.get_user_by_session_token(session["user_token"])
    {:ok, socket |> assign(:current_user, current_user)}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    your_plot = Dashboard.get_your_plots!(id)

    {:ok, column_record} =
      GitHubClient.fetch_csv_headers(
        your_plot.dataset_name,
        your_plot.expression
      )

    dataset = create_histogram_dataset(your_plot.expression, column_record)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:your_plots, Dashboard.get_your_plots!(id))
     |> assign(:dataset, dataset)}
  end

  defp page_title(:show), do: "Show Your plots"
  defp page_title(:edit), do: "Edit Your plots"

  defp create_histogram_dataset(column_name, column_record) do
    Enum.map(column_record, fn record -> %{x: record, y: column_name} end)
  end
end
