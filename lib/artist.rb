require_relative "./concerns/findable"

class Artist
    extend Concerns::Findable
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
    end

    def save
        self.class.all << self
        self
    end

    def songs
        Song.all.select { |song| song.artist == self }
    end

    def add_song(song)
        song.artist = self unless song.artist
    end

    def genres
        genres_list = self.songs.collect { |song| song.genre }
        genres_list.uniq
    end

    def self.all
        @@all
    end

    def self.destroy_all
        all.clear
    end

    def self.create(name)
        artist = Artist.new(name)
        artist.save
    end

end