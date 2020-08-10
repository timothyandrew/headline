defmodule Headline.Fetcher do
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = for i <- 0..2 do
      Supervisor.child_spec(Headline.Fetcher.Worker, id: "fetcher_#{i}")
    end


    Supervisor.init(children, strategy: :one_for_one)
  end
end
