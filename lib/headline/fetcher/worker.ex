defmodule Headline.Fetcher.Worker do
  alias Ecto.Repo
  alias Headline.RSS
  alias Headline.RSS.Item

  use Task, restart: :temporary
  require Logger

  def start_link(opts) do
    Task.start_link(__MODULE__, :run, opts)
  end

  def run do
    IO.puts("FOO")
    item = RSS.get_random_item_nohtml()

    Logger.info("Attempting to fetch HTML for: #{item.title}")

    %{body: body} = HTTPoison.get!(item.url)
    RSS.update_item(item, %{html: body})

    Logger.info("Done fetching for: #{item.title}")
  end
end
