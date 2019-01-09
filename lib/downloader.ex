require Config

defmodule Downloader do
  def init

  @file_name "ObjectName"
  #  @expected_fields ~w( ObjectName )

  def get_filename(url) do
    url
    |> String.split("/")
    |> List.last
  end

  def get_endpoint(endpoint, decode \\ true) do
    case HTTPoison.get(endpoint, Config.headers) do
      { :ok, res } -> decode && Poison.decode! res.body || res.body
      { _, out } -> out
    end
  end

  def count_files(path \\ Config.base_endpoint) do
    amount = get_endpoint(path)
             |> Enum.count
    "#{amount} files found in #{path}"
  end

  def list_files(path \\ Config.base_endpoint, limit \\ 10) do
    get_endpoint(path)
    |> Enum.map(&(Map.get(&1, @file_name)))
    |> Enum.take(limit)
  end

  def write_file(resp) do
    name = get_filename(resp.request_url)
    File.write(name, resp.body)
  end

  #  @spec download(string) :: unit
  def download(path) do
    target = Config.base_endpoint
             |> URI.merge(path)
             |> URI.to_string()
    #    get_endpoint(target, false)
    case HTTPoison.get(target, Config.headers) do
      { :ok, res } -> write_file(res)
    end
  end
end
