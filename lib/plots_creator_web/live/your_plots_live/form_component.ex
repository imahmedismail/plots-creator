defmodule PlotsCreatorWeb.YourPlotsLive.FormComponent do
  use PlotsCreatorWeb, :live_component

  alias PlotsCreator.Dashboard

  @impl true
  def update(%{your_plots: your_plots} = assigns, socket) do
    changeset = Dashboard.change_your_plots(your_plots)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"your_plots" => your_plots_params}, socket) do
    changeset =
      socket.assigns.your_plots
      |> Dashboard.change_your_plots(your_plots_params)
      |> Map.put(:action, :validate)

    {:noreply, socket |> assign(:changeset, changeset)}
  end

  def handle_event("save", %{"your_plots" => your_plots_params}, socket) do
    save_your_plots(socket, socket.assigns.action, your_plots_params)
  end

  defp save_your_plots(socket, :edit, your_plots_params) do
    case Dashboard.update_your_plots(
           socket.assigns.your_plots,
           your_plots_params
         ) do
      {:ok, _your_plots} ->
        {:noreply,
         socket
         |> put_flash(:info, "Your plots updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_your_plots(socket, :new, your_plots_params) do
    case Dashboard.create_your_plots(your_plots_params) do
      {:ok, _your_plots} ->
        {:noreply,
         socket
         |> put_flash(:info, "Your plots created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
