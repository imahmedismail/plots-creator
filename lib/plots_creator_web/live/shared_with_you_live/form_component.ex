defmodule PlotsCreatorWeb.SharedWithYouLive.FormComponent do
  use PlotsCreatorWeb, :live_component

  alias PlotsCreator.Dashboard

  @impl true
  def update(%{shared_with_you: shared_with_you} = assigns, socket) do
    changeset = Dashboard.change_shared_with_you(shared_with_you)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event(
        "validate",
        %{"shared_with_you" => shared_with_you_params},
        socket
      ) do
    changeset =
      socket.assigns.shared_with_you
      |> Dashboard.change_shared_with_you(shared_with_you_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event(
        "save",
        %{"shared_with_you" => shared_with_you_params},
        socket
      ) do
    save_shared_with_you(socket, socket.assigns.action, shared_with_you_params)
  end

  defp save_shared_with_you(socket, :edit, shared_with_you_params) do
    case Dashboard.update_shared_with_you(
           socket.assigns.shared_with_you,
           shared_with_you_params
         ) do
      {:ok, _shared_with_you} ->
        {:noreply,
         socket
         |> put_flash(:info, "Shared with you updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_shared_with_you(socket, :new, shared_with_you_params) do
    case Dashboard.create_shared_with_you(shared_with_you_params) do
      {:ok, _shared_with_you} ->
        {:noreply,
         socket
         |> put_flash(:info, "Shared with you created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
