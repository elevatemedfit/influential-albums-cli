class MostInfluentialAlbums::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.rollingstone.com/interactive/most-groundbreaking-albums-of-all-time/"))
  end

  def scrape_albums_index
    self.get_page.css(".album") #Full list of albums.
  end

  def make_albums #link to Album class.
    scrape_albums_index.each do |album|
      MostInfluentialAlbums::Album.new_from_index_page(album)
    end
  end
end