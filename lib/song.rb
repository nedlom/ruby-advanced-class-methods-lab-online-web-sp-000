require 'pry'

class Song
  attr_accessor :name, :artist_name
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def save
    self.class.all << self
  end
  
  def self.create
   song = self.new
   song.save
   song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|s| s.name == name}
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    song ? song : self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end
  
  def self.new_from_filename(filename)
    data = filename.split(/.mp3| - /)
    song = self.new
    song.artist_name = data[0]
    song.name = data[1]
    song
  end
  
  def self.create_from_filename(filename)
    data = filename.split(/.mp3| - /)
    song = self.new
    song.artist_name = data[0]
    song.name = data[1]
    song.save
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
  
#   attr_accessor :name, :artist_name
  
#   @@all = []

#   def self.all
#     @@all
#   end
  
#   def self.create
#     song = self.new
#     self.all << song
#     song
#   end
  
#   def self.new_by_name(name_of_song)
#     song = self.new
#     song.name = name_of_song
#     song
#   end
  
#   def self.create_by_name(name_of_song)
#     song = self.new
#     song.name = name_of_song
#     self.all << song
#     song
#   end

#   def self.find_by_name(name_of_song)
#     self.all.detect{|i| i.name == name_of_song}
#   end
  
#   def self.find_or_create_by_name(name_of_song)
#     if self.find_by_name(name_of_song)
#       self.find_by_name(name_of_song)
#     else
#       self.create_by_name(name_of_song)
#     end
#   end
  
#   def self.alphabetical
#     self.all.sort{|a,b| a.name <=> b.name}
#   end
  
#   def self.new_from_filename(filename)
#     song = self.new
#     song.artist_name = filename.split(/( - )|[.]/)[0]
#     song.name = filename.split(/(?: - )|[.]/)[1]
#     song
#   end
  
#   def self.create_from_filename(filename)
#     song = self.new
#     song.artist_name = filename.split(/( - )|[.]/)[0]
#     song.name = filename.split(/(?: - )|[.]/)[1]
#     self.all << song
#     song
#   end
  
#   def self.destroy_all
#     self.all.clear
#   end

# end
