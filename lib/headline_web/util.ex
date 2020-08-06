defmodule HeadlineWeb.Util do
  def bool_to_int(b) do
    if b, do: 1, else: 0
  end
end
