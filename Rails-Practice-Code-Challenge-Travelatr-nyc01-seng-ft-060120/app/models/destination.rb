class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts 

    def most_reacent
        self.posts.last(5)
    end

    def feactured 
        self.posts.max_by {|post| post.likes}
    end
end
