defmodule Utils do
  @moduledoc false
  def relative(path), do: Path.relative_to_cwd(path)

  def get_filename(url) do
    url
    |> String.split("/")
    |> List.last
  end

  def with_access_key(f) do
    if !Config.has_key do
      exit("")
    else
      f.()
    end
  end
end
