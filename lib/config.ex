defmodule Config do
  @moduledoc """
    Configuration for requests and common constants
  """
  @storage "hifumistorage"

  @base_endpoint "https://storage.bunnycdn.com/#{@storage}/"

  def headers do
    [
      { "AccessKey", System.get_env("AccessKey") },
      { "Accept", "application/json" },
      { "User-Agent", "BunnyCLI Client" }
    ]
  end
  def base_endpoint, do: @base_endpoint

  @spec endpoint(string) :: URI
  def endpoint(paths), do: URI.merge(@base_endpoint, paths)
end
