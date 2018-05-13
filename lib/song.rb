class Song
  attr_accessor :name, :artist
  
  def initialize(name)
    @name = name
  end
  
  def self.new_by_filename(filename)
    parsed_filename = filename.chomp(".mp3").split(" - ")
    artist = parsed_filename[0]
    song_name = parsed_filename[1]
    
    song = self.new(song_name)
    song.artist_name = artist
    song
  end
  
  def artist_name=(artist_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(self)
  end
end