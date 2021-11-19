require_relative "./concerns/findable"

class Genre
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
        Song.all.select { |song| song.genre == self }
    end

    def add_song(song)
        song.genre = self unless song.genre
    end

    def artists
        artists_list = self.songs.collect { |song| song.artist }
        artists_list.uniq
    end

    def self.all
        @@all
    end

    def self.destroy_all
        all.clear
    end

    def self.create(name)
        genre = Genre.new(name)
        genre.save
    end

end