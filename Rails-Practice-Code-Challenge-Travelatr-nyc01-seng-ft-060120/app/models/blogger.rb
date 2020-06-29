class Blogger < ApplicationRecord
    has_many :posts 
    has_many :destinations, through: :posts 

    validates :name, :uniqueness => true
    validates :bio, :length => {minimum:30}
    validates :age, :numericality => {greater_then: 0}


    def total_likes 
      self.posts.sum {|post| post.likes}
       
    end

    def most_liked 
        self.posts.max_by {|post| post.likes}
    end
end
