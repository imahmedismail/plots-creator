defmodule PlotsCreatorWeb.SharedWithYouLive.Show do
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

    case GitHubClient.fetch_csv_headers(
           your_plot.dataset_name,
           your_plot.expression
         ) do
      {:ok, column_record} ->
        dataset = create_histogram_dataset(your_plot.expression, column_record)

        {:noreply,
         socket
         |> assign(:page_title, page_title(socket.assigns.live_action))
         |> assign(:your_plots, Dashboard.get_your_plots!(id))
         |> assign(:dataset, dataset)}

      {:error, "failed to fetch CSV file"} ->
        {:noreply,
         socket
         |> put_flash(
           :error,
           "No such csv exists on the repo, please ask plot owner to change the csv-file!"
         )
         |> redirect(to: Routes.shared_with_you_index_path(socket, :index))}

      {:error, :column_not_found} ->
        {:noreply,
         socket
         |> put_flash(
           :error,
           "No such expression/column present in the selected csv file, please ask the plot owner to set the correct expression/column!"
         )
         |> redirect(to: Routes.shared_with_you_index_path(socket, :index))}
    end
  end

  defp page_title(:show), do: "Show Shared with you"
  defp page_title(:edit), do: "Edit Shared with you"

  defp create_histogram_dataset(column_name, column_record) do
    Enum.map(column_record, fn record -> %{x: record, y: column_name} end)
  end
end
