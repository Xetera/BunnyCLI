require Downloader

defmodule Bunnycli.Entry do
  @moduledoc """
  Documentation for Bunnycli.
  """
  def main(args) do
    { opts, input, _ } = OptionParser.parse(
      args,
      switches: [
        file: :string
      ],
      aliases: [
        f: :file
      ]
    )
    [cmd | rest] = input
    case cmd do
      "count" -> Downloader.count_files(rest)
      "download" -> Downloader.download(rest |> Enum.at(0))
    end
    |> IO.puts
  end
end
