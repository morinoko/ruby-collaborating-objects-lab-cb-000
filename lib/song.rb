class Song
  attr_accessor :name, :artist
  
  def initialize(name)
    @name = name
  end
  
  def self.new_by_filename(filename)
    # Create from mp3 files in this format: 'Michael Jackson - Black or White - pop.mp3'
    artist, song_name = filename.chomp(".mp3").split(" - ")
    song = self.new(song_name)
    song.artist_name = artist
    song
  end
  
  def artist_name=(artist_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(self)
  end
end