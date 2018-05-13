class MP3Importer
  attr_accessor :path
  
  def initialize(file_path)
    @path = file_path
  end
  
  def files
    files = Dir.entries(self.path)
    # Select only mp3 files
    @files = files.select do |file|
      file.end_with?(".mp3")
    end
  end
  
  def import
    self.files.each do |song_file|
      song = Song.new_by_filename(song_file)
    end
  end
end