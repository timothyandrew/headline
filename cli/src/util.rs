use regex::Regex;
use std::error::Error;

pub async fn get_html_page_title(url: &str) -> Result<String, Box<dyn Error>> {
    // TODO: Use an actual HTML parser
    let regex = if url.contains("youtube.com") {
        Regex::new("\"twitter:title\" content=\"([^\"]*)\"")?
    } else {
        Regex::new("<title[^>]*>([^<]*)</title>")?
    };

    // TODO: Stop fetching once we see a boundary
    let text = reqwest::get(url).await?.text().await?;

    let title = regex.captures(&text).unwrap().get(1).unwrap();
    let title = title.as_str().to_owned();
    let title = title.replace("\n", " ");
    let title = htmlescape::decode_html(&title).unwrap_or(title);

    Ok(title)
}
