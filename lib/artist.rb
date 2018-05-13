class Artist
  attr_accessor :name, :songs
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    self.save
  end
  
  def save
    @@all << self
  end
  
  def add_song(song)
    @songs << song
    song.artist = self
  end
  
  def self.find_by_name(searched_name)
    @@all.find{ |artist| artist.name == searched_name }
  end
  
  def self.find_or_create_by_name(artist_name)
    self.find_by_name(artist_name) || self.new(artist_name)
  end
  
  def print_songs
    @songs.each{ |song| puts song.name }
  end
  
  def self.all
    @@all
  end
end