class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts 

    def most_liked
        self.posts.max_by do |post|
             post.likes
         end
     end

     def average_age
        ages = self.bloggers.uniq.map do |blogger|
            blogger.age
     end
     ages.sum(0.0) / ages.size
    end


end
