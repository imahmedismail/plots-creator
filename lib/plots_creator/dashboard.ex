defmodule PlotsCreator.Dashboard do
  @moduledoc """
  The Dashboard context.
  """

  import Ecto.Query, warn: false
  alias PlotsCreator.Repo

  alias PlotsCreator.Dashboard.YourPlots

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
end
