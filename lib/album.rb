class Album

  @@albums = []

  attr_reader(:title, :artist)

  def Album.clear
    @@albums = []
  end

  def Album.all
    @@albums
  end

  def Album.search(input)
    Album.all.select do |album|
      album.title == input || album.artist.name == input
    end
  end

  def Album.artist_albums(name)
    titles = []
    Album.all.each do |album|
      if album.artist.name == name
        titles << album.title
      end
    end
      titles
  end

  def initialize(attributes)
    @title = attributes[:title]
    @artist = Artist.new(attributes[:name])
    self.save
  end

  def save
    @@albums << self
  end
end
