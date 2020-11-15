class Song < ActiveRecord::Base
    require_all 'app'

    has_many :song_genres
    has_many :genres, through: :song_genres
    belongs_to :artist
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods

end