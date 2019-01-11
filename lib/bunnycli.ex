defmodule Bunnycli.Entry do
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
    joined = Enum.join(rest, " ")
    case cmd do
      "count" ->
        Downloader.count_files(joined)
      "download" ->
        Downloader.download(joined)
      "upload" ->
        Uploader.upload(joined)
    end
  end
end
