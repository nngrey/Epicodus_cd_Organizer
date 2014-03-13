class Organizer

  @@albums = []

  attr_reader(:album, :artist)

  def Organizer.clear
    @@albums = []
  end

  def Organizer.all
    @@albums
  end

  def Organizer.search(input)
    Organizer.all.select do |album|
      album.album == input || album.artist == input
    end
  end

  def Organizer.artist_albums(artist)
    titles = []
    Organizer.all.each do |album|
      if album.artist == artist
        titles << album.album
      end
    end
      titles
  end

  def initialize(attributes)
    @album = attributes[:album]
    @artist = attributes[:artist]
    self.save
  end

  def save
    @@albums << self
  end
end
