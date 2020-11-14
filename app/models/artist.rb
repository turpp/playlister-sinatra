class Artist < ActiveRecord::Base
has_many :songs
has_many :genres, through: :songs

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
    
    artist=Artist.find_by(name: t.join(" "))
end

end
    
