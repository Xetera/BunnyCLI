defmodule Config do
  @moduledoc """
    Configuration for requests and common constants
  """
  @storage "hifumistorage"

  @base_endpoint "https://storage.bunnycdn.com/#{@storage}/"

  def access_key, do: System.get_env("AccessKey")
  def redirect, do: System.get_env("bunny_url")

  def has_key do
    access_key != nil
  end

  def headers do
    [
      { "AccessKey", access_key },
      { "Accept", "application/json" },
      { "User-Agent", "BunnyCLI Client" }
    ]
  end
  def base_endpoint, do: @base_endpoint

  @spec endpoint(string) :: URI
  def endpoint(paths), do: URI.merge(@base_endpoint, paths)
end
