defmodule HeadlineWeb.BaseView do
  use HeadlineWeb, :view
  use Timex

  def render("base.json", _params) do
    %{
      api_version: 3,
      auth: 1,
      # TODO: Use an accurate timestamp here
      last_refreshed_on_time: Timex.to_unix(DateTime.utc_now)
    }
  end
end
