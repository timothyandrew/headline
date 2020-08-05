defmodule Headline.RSSTest do
  use Headline.DataCase

  alias Headline.RSS

  describe "feeds" do
    alias Headline.RSS.Feed

    @valid_attrs %{is_spark: true, last_updated_on_time: "2010-04-17T14:00:00Z", site_url: "some site_url", title: "some title", url: "some url"}
    @update_attrs %{is_spark: false, last_updated_on_time: "2011-05-18T15:01:01Z", site_url: "some updated site_url", title: "some updated title", url: "some updated url"}
    @invalid_attrs %{is_spark: nil, last_updated_on_time: nil, site_url: nil, title: nil, url: nil}

    def feed_fixture(attrs \\ %{}) do
      {:ok, feed} =
        attrs
        |> Enum.into(@valid_attrs)
        |> RSS.create_feed()

      feed
    end

    test "list_feeds/0 returns all feeds" do
      feed = feed_fixture()
      assert RSS.list_feeds() == [feed]
    end

    test "get_feed!/1 returns the feed with given id" do
      feed = feed_fixture()
      assert RSS.get_feed!(feed.id) == feed
    end

    test "create_feed/1 with valid data creates a feed" do
      assert {:ok, %Feed{} = feed} = RSS.create_feed(@valid_attrs)
      assert feed.is_spark == true
      assert feed.last_updated_on_time == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert feed.site_url == "some site_url"
      assert feed.title == "some title"
      assert feed.url == "some url"
    end

    test "create_feed/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RSS.create_feed(@invalid_attrs)
    end

    test "update_feed/2 with valid data updates the feed" do
      feed = feed_fixture()
      assert {:ok, %Feed{} = feed} = RSS.update_feed(feed, @update_attrs)
      assert feed.is_spark == false
      assert feed.last_updated_on_time == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert feed.site_url == "some updated site_url"
      assert feed.title == "some updated title"
      assert feed.url == "some updated url"
    end

    test "update_feed/2 with invalid data returns error changeset" do
      feed = feed_fixture()
      assert {:error, %Ecto.Changeset{}} = RSS.update_feed(feed, @invalid_attrs)
      assert feed == RSS.get_feed!(feed.id)
    end

    test "delete_feed/1 deletes the feed" do
      feed = feed_fixture()
      assert {:ok, %Feed{}} = RSS.delete_feed(feed)
      assert_raise Ecto.NoResultsError, fn -> RSS.get_feed!(feed.id) end
    end

    test "change_feed/1 returns a feed changeset" do
      feed = feed_fixture()
      assert %Ecto.Changeset{} = RSS.change_feed(feed)
    end
  end

  describe "groups" do
    alias Headline.RSS.Group

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def group_fixture(attrs \\ %{}) do
      {:ok, group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> RSS.create_group()

      group
    end

    test "list_groups/0 returns all groups" do
      group = group_fixture()
      assert RSS.list_groups() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert RSS.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      assert {:ok, %Group{} = group} = RSS.create_group(@valid_attrs)
      assert group.title == "some title"
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RSS.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
      assert {:ok, %Group{} = group} = RSS.update_group(group, @update_attrs)
      assert group.title == "some updated title"
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = RSS.update_group(group, @invalid_attrs)
      assert group == RSS.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = RSS.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> RSS.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = RSS.change_group(group)
    end
  end

  describe "items" do
    alias Headline.RSS.Item

    @valid_attrs %{author: "some author", html: "some html", is_read: true, is_saved: true, title: "some title", url: "some url"}
    @update_attrs %{author: "some updated author", html: "some updated html", is_read: false, is_saved: false, title: "some updated title", url: "some updated url"}
    @invalid_attrs %{author: nil, html: nil, is_read: nil, is_saved: nil, title: nil, url: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> RSS.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert RSS.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert RSS.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = RSS.create_item(@valid_attrs)
      assert item.author == "some author"
      assert item.html == "some html"
      assert item.is_read == true
      assert item.is_saved == true
      assert item.title == "some title"
      assert item.url == "some url"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RSS.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = RSS.update_item(item, @update_attrs)
      assert item.author == "some updated author"
      assert item.html == "some updated html"
      assert item.is_read == false
      assert item.is_saved == false
      assert item.title == "some updated title"
      assert item.url == "some updated url"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = RSS.update_item(item, @invalid_attrs)
      assert item == RSS.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = RSS.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> RSS.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = RSS.change_item(item)
    end
  end
end
