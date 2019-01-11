defmodule Uploader do
  @moduledoc false
  def put_endpoint(file_name, file_path) do
    endpoint = Config.base_endpoint <> file_name
    out = Config.redirect <> file_name
    case HTTPoison.put(endpoint, { :file, file_path }, Config.headers) do
      { :ok, %HTTPoison.Response{ status_code: 201 } } -> "Successfully uploaded #{file_name}\n#{out}"
      { :error, err } -> err
    end
  end

  def upload(path) do
    run = fn ->
      file = Utils.relative(path)

      if File.exists?(file) do
        Utils.get_filename(file)
        |> Uploader.put_endpoint(path)
      else
        "No such file named #{path}."
      end
    end
    Utils.with_access_key(run)
  end
end
