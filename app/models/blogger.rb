class Blogger < ApplicationRecord
    has_many :posts 
    has_many :destinations, through: :posts
    validates :name, :presence => true
    validates :name, :uniqueness => true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, :length => { :minimum => 31}

# total likes 
    def total_likes
        self.posts.map {|post| post.likes}
    end 

end
