defmodule PlotsCreator.GitHubClient do
  @base_url "https://api.github.com/repos/plotly/datasets/contents"
  @headers [
    {"User-Agent", "Elixir"},
    {"Authorization", "token #{System.get_env("GITHUB_TOKEN")}"}
  ]

  def fetch_csv_headers(csv_name, column_name) do
    case HTTPoison.get("#{@base_url}/#{csv_name}", @headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Jason.decode!()
        |> Map.get("download_url")
        |> fetch_and_parse_csv(column_name)

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        IO.puts("Failed to fetch CSV file. Status code: #{status_code}")
        {:error, "failed to fetch CSV file"}

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts("Request failed: #{reason}")
        {:error, reason}
    end
  end

  defp fetch_and_parse_csv(download_url, column_name) do
    case HTTPoison.get(download_url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: csv_content}} ->
        parse_csv(csv_content, column_name)

      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        IO.puts("Failed to download CSV file. Status code: #{status_code}")
        {:error, status_code}

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.puts("Download request failed: #{reason}")
        {:error, reason}
    end
  end

  defp parse_csv(csv_content, column_name) do
    lines = String.split(csv_content, "\n", trim: true)
    [header | _records] = lines
    headers = String.split(header, ",", trim: true)

    NimbleCSV.RFC4180.parse_string(csv_content)
    |> case do
      rows ->
        column_index =
          Enum.find_index(headers, fn header -> header == column_name end)

        if column_index do
          records = Enum.map(rows, fn row -> Enum.at(row, column_index) end)
          {:ok, records}
        else
          {:error, :column_not_found}
        end
    end
  end
end
