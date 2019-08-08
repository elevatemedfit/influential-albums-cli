class MostInfluentialAlbums::Album
  attr_reader :artist_name, :album_name, :album_year, :album_description, :related_albums
  @@all = []

  def self.new_from_index_page(album) #custom constructor.
    self.new(
      album.css(".album-artist").text,
      album.css(".album-name").text,
      album.css(".year").text,
      album.css('.album-body').text.strip,
      album.css('.album-footer li').text)
  end
  

  def initialize(artist_name=nil, album_name=nil, album_year=nil, album_description=nil, related_albums=[])
    @artist_name = artist_name
    @album_name = album_name
    @album_year = album_year
    @album_description = album_description
    @related_albums = related_albums
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end
end

