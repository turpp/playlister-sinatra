class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :songGenres
    has_many :genres, through: :songGenres

    def slug
        name=self.name.downcase
        name.gsub(' ','-')
    end
    
    def self.find_by_slug(slug)
        name=slug.gsub('-',' ')
        i=name.split(" ")
        t = i.collect do |t|
            t.capitalize
        end
        
        song=Song.find_by(name: t.join(" "))
    end
    

end