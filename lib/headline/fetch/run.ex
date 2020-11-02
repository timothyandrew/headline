defmodule Headline.Fetch.Run do
  @derive {Jason.Encoder, only: [:success, :fail, :run_id]}
  defstruct run_id: "", success: [], fail: [], tasks: []
end
