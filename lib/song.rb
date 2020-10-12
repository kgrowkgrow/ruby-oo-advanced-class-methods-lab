require 'pry'

class Song
  attr_accessor  :artist_name, :name
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
    song_object = self.new
    song_object.name = name
    song_object
  end 

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save 
    song
  end 

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end 

  def self.find_or_create_by_name(name)
    return find_by_name(name) if find_by_name(name)
  
      create_by_name(name)
  end 

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(song_info)
    artist, song = song_info.split(" - ")
    new_song = self.find_or_create_by_name(song.split(".")[0])
    new_song.artist_name = artist
    return new_song
  end

  def self.create_from_filename(info)
    new_song = self.new_from_filename(info).save 
    return new_song
  end

  def self.destroy_all
    @@all.clear
  end

    


end
