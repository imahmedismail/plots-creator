defmodule PlotsCreator.Dashboard do
  @moduledoc """
  The Dashboard context.
  """

  import Ecto.Query, warn: false
  alias PlotsCreator.Repo

  alias PlotsCreator.Dashboard.{YourPlots, SharedWithYou}

  @doc """
  Returns the list of your_plots.

  ## Examples

      iex> list_your_plots()
      [%YourPlots{}, ...]

  """
  def list_your_plots do
    Repo.all(YourPlots)
  end

  @doc """
  Gets a single your_plots.

  Raises `Ecto.NoResultsError` if the Your plots does not exist.

  ## Examples

      iex> get_your_plots!(123)
      %YourPlots{}

      iex> get_your_plots!(456)
      ** (Ecto.NoResultsError)

  """
  def get_your_plots!(id), do: Repo.get!(YourPlots, id)

  @doc """
  Creates a your_plots.

  ## Examples

      iex> create_your_plots(%{field: value})
      {:ok, %YourPlots{}}

      iex> create_your_plots(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_your_plots(attrs \\ %{}) do
    %YourPlots{}
    |> YourPlots.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a your_plots.

  ## Examples

      iex> update_your_plots(your_plots, %{field: new_value})
      {:ok, %YourPlots{}}

      iex> update_your_plots(your_plots, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_your_plots(%YourPlots{} = your_plots, attrs) do
    your_plots
    |> YourPlots.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a your_plots.

  ## Examples

      iex> delete_your_plots(your_plots)
      {:ok, %YourPlots{}}

      iex> delete_your_plots(your_plots)
      {:error, %Ecto.Changeset{}}

  """
  def delete_your_plots(%YourPlots{} = your_plots) do
    Repo.delete(your_plots)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking your_plots changes.

  ## Examples

      iex> change_your_plots(your_plots)
      %Ecto.Changeset{data: %YourPlots{}}

  """
  def change_your_plots(%YourPlots{} = your_plots, attrs \\ %{}) do
    YourPlots.changeset(your_plots, attrs)
  end

  @doc """
  Returns the list of shared_with_yous.

  ## Examples

      iex> list_shared_with_yous()
      [%SharedWithYou{}, ...]

  """
  def list_shared_with_yous do
    Repo.all(SharedWithYou)
  end

  @doc """
  Gets a single shared_with_you.

  Raises `Ecto.NoResultsError` if the Shared with you does not exist.

  ## Examples

      iex> get_shared_with_you!(123)
      %SharedWithYou{}

      iex> get_shared_with_you!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shared_with_you!(id), do: Repo.get!(SharedWithYou, id)

  @doc """
  Creates a shared_with_you.

  ## Examples

      iex> create_shared_with_you(%{field: value})
      {:ok, %SharedWithYou{}}

      iex> create_shared_with_you(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shared_with_you(attrs \\ %{}) do
    %SharedWithYou{}
    |> SharedWithYou.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shared_with_you.

  ## Examples

      iex> update_shared_with_you(shared_with_you, %{field: new_value})
      {:ok, %SharedWithYou{}}

      iex> update_shared_with_you(shared_with_you, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shared_with_you(%SharedWithYou{} = shared_with_you, attrs) do
    shared_with_you
    |> SharedWithYou.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shared_with_you.

  ## Examples

      iex> delete_shared_with_you(shared_with_you)
      {:ok, %SharedWithYou{}}

      iex> delete_shared_with_you(shared_with_you)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shared_with_you(%SharedWithYou{} = shared_with_you) do
    Repo.delete(shared_with_you)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shared_with_you changes.

  ## Examples

      iex> change_shared_with_you(shared_with_you)
      %Ecto.Changeset{data: %SharedWithYou{}}

  """
  def change_shared_with_you(%SharedWithYou{} = shared_with_you, attrs \\ %{}) do
    SharedWithYou.changeset(shared_with_you, attrs)
  end
end
