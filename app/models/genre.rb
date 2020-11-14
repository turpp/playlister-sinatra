class Genre < ActiveRecord::Base
    
    has_many :songGenres
    has_many :songs, through: :songGenres
    has_many :artists, through: :songs
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
        
        genre=Genre.find_by(name: t.join(" "))
    end
    
end