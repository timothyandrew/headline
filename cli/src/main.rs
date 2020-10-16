use clap::{App, Arg, SubCommand};
use std::env;
use tokio_postgres::{NoTls};

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let port = env::var("PORT").unwrap_or("5432".to_owned());
    let database = env::var("DATABASE").unwrap_or("headline_prod".to_owned());
    let password = env::var("PASSWORD").unwrap_or_default();
    let connection_string = format!(
        "host=localhost user=postgres port={} dbname={} password={}",
        port, database, password
    );

    let (client, connection) = tokio_postgres::connect(&connection_string, NoTls).await?;

    tokio::spawn(async move {
        if let Err(e) = connection.await {
            eprintln!("pg connection error: {}", e);
        }
    });

    // let value: &str = feeds[0].get(0);

    let matches = App::new("Headline CLI").subcommand(
        SubCommand::with_name("add-learning-item")
            .arg(
                Arg::with_name("title")
                    .short("t")
                    .long("title")
                    .takes_value(true)
                    .required(false),
            )
            .arg(
                Arg::with_name("url")
                    .takes_value(true)
                    .short("u")
                    .long("url")
                    .required(true),
            )
            .arg(
                Arg::with_name("type")
                    .short("y")
                    .takes_value(true)
                    .long("type")
                    .required(true),
            ),
    );

    let matches = matches.get_matches();

    match matches.subcommand() {
        ("add-learning-item", Some(c)) => {
            let feeds = cli::get_feeds(&client).await?;

            let url = c.value_of("url").unwrap().to_owned();
            let title = c.value_of("title");

            let item = cli::Item {
                title: match title {
                    Some(title) => title.to_owned(),
                    None => cli::util::get_html_page_title(&url).await?,
                },
                url,
            };

            let feed = c.value_of("type").unwrap();
            let feed = feeds.iter().find(|&f| f.title == feed);
            let feed = feed.expect(&format!(
                "Invalid feed; wasn't present in the `feeds` table. Valid feeds: {:?}",
                feeds
            ));

            cli::add_learning_item(&client, &feed, &item).await?;
            eprintln!("Item {:?} added!", item);
        }
        (_, _) => panic!("Invalid subcommand!"),
    };

    Ok(())
}
