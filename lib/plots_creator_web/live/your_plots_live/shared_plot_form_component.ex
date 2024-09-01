defmodule PlotsCreatorWeb.YourPlotsLive.SharedPlotFormComponent do
  alias PlotsCreator.Accounts
  use PlotsCreatorWeb, :live_component

  alias PlotsCreator.Dashboard

  @impl true
  def update(%{shared_with_you: shared_with_you, current_user: current_user} = assigns, socket) do
    changeset = Dashboard.change_shared_with_you(shared_with_you)
    all_users = Accounts.list_users() |> Enum.reject(& &1.id == current_user.id) |> transform_users_into_select_options()

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)
     |> assign(:all_users, all_users)}
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
    save_shared_with_you(socket, shared_with_you_params)
  end

  defp save_shared_with_you(socket, shared_with_you_params) do
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

  defp transform_users_into_select_options(users) do
    Enum.map(users, &{&1.email, &1.id})
  end
end
