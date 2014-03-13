class Artist

  @@artists = []

  attr_reader(:name)

  def initialize(name)
    @name = name
    self.save
  end

  def save
    @@artists << self
  end
end
