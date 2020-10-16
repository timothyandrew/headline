pub mod util;

use tokio_postgres::{Client, Error};

#[derive(Debug)]
pub struct Feed {
    pub id: i64,
    pub title: String,
}

#[derive(Debug)]
pub struct Item {
    pub url: String,
    pub title: String,
}

pub async fn get_feeds(client: &Client) -> Result<Vec<Feed>, Error> {
    let feeds = client
        .query("select id, title from feeds where url is null", &[])
        .await?;

    Ok(feeds
        .iter()
        .map(|f| Feed {
            id: f.get(0),
            title: f.get(1),
        })
        .collect())
}

// TODO: Use Diesel
pub async fn add_learning_item(client: &Client, feed: &Feed, item: &Item) -> Result<(), Error> {
    client.execute(
        "insert into items(url, title, feed_id) values ($1, $2, $3)",
        &[&item.url, &item.title, &feed.id],
    ).await?;

    Ok(())
}
