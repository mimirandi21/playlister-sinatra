class Artist < ActiveRecord::Base
    require_all 'app'

    has_many :songs
    has_many :genres, through: :songs
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end