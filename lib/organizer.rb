class Organizer

  @@albums = []

  attr_reader(:album, :artist)

  def Organizer.clear
    @@albums = []
  end

  def initialize(attributes)
    @album = attributes[:album]
    @artist = attributes[:artist]
    self.save
  end

  def save
    @@albums << self
  end

  def Organizer.all
    @@albums
  end

end



