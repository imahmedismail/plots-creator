defmodule PlotsCreator.GitHubClient do
  @base_url "https://api.github.com/repos/plotly/datasets/contents"
  @headers [{"User-Agent", "Elixir"}, {"Authorization", "token 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"}]

  def fetch_csv_files do
    case HTTPoison.get(@base_url, @headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Jason.decode!()
        |> Enum.filter(&(&1["name"] =~ ~r/\.csv$/))
        |> Enum.map(& &1["name"])

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        IO.puts("Failed to fetch files. Status code: #{status_code}")
        []

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts("Request failed: #{reason}")
        []
    end
  end

  def fetch_csv_headers(csv_name) do
    case HTTPoison.get("#{@base_url}/#{csv_name}", @headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Jason.decode!()
        |> Map.get("download_url")
        |> fetch_and_parse_csv_headers()

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        IO.puts("Failed to fetch CSV file. Status code: #{status_code}")
        []

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts("Request failed: #{reason}")
        []
    end
  end

  defp fetch_and_parse_csv_headers(download_url) do
    case HTTPoison.get(download_url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: csv_content}} ->
        csv_content
        |> parse_csv_headers()

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        IO.puts("Failed to download CSV file. Status code: #{status_code}")
        []

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts("Download request failed: #{reason}")
        []
    end
  end

  defp parse_csv_headers(csv_content) do
    csv_content
    |> String.split("\n")
    |> List.first()
    |> String.split(",")
  end

  def generate_select_options(filenames) do
    filenames
    |> Enum.map(&parse_filename/1)
  end

  defp parse_filename(filename) do
    readable_name = filename
    |> String.replace(~r/[_-]/, " ")
    |> String.replace(~r/\b[a-z]/, &String.upcase(&1))
    |> String.replace(~r/\s+/, " ")

    {readable_name, filename}
  end

  def generate_original_form_from_human_readable_name(human_readable_name) do
    human_readable_name
    |> String.replace(~r/\s+/, "_")
    |> String.downcase()
  end
end
