defmodule HeadlineWeb.FeedControllerTest do
  use HeadlineWeb.ConnCase

  alias Headline.RSS
  alias Headline.RSS.Feed

  @create_attrs %{
    is_spark: true,
    last_updated_on_time: "2010-04-17T14:00:00Z",
    site_url: "some site_url",
    title: "some title",
    url: "some url"
  }
  @update_attrs %{
    is_spark: false,
    last_updated_on_time: "2011-05-18T15:01:01Z",
    site_url: "some updated site_url",
    title: "some updated title",
    url: "some updated url"
  }
  @invalid_attrs %{is_spark: nil, last_updated_on_time: nil, site_url: nil, title: nil, url: nil}

  def fixture(:feed) do
    {:ok, feed} = RSS.create_feed(@create_attrs)
    feed
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all feeds", %{conn: conn} do
      conn = get(conn, Routes.feed_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create feed" do
    test "renders feed when data is valid", %{conn: conn} do
      conn = post(conn, Routes.feed_path(conn, :create), feed: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.feed_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_spark" => true,
               "last_updated_on_time" => "2010-04-17T14:00:00Z",
               "site_url" => "some site_url",
               "title" => "some title",
               "url" => "some url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.feed_path(conn, :create), feed: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update feed" do
    setup [:create_feed]

    test "renders feed when data is valid", %{conn: conn, feed: %Feed{id: id} = feed} do
      conn = put(conn, Routes.feed_path(conn, :update, feed), feed: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.feed_path(conn, :show, id))

      assert %{
               "id" => id,
               "is_spark" => false,
               "last_updated_on_time" => "2011-05-18T15:01:01Z",
               "site_url" => "some updated site_url",
               "title" => "some updated title",
               "url" => "some updated url"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, feed: feed} do
      conn = put(conn, Routes.feed_path(conn, :update, feed), feed: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete feed" do
    setup [:create_feed]

    test "deletes chosen feed", %{conn: conn, feed: feed} do
      conn = delete(conn, Routes.feed_path(conn, :delete, feed))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.feed_path(conn, :show, feed))
      end
    end
  end

  defp create_feed(_) do
    feed = fixture(:feed)
    %{feed: feed}
  end
end
