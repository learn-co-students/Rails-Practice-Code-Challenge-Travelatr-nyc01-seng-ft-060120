class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_liked
        self.posts.max_by do |post|
            post.likes
        end
    end

    def recent_posts
        self.posts.max_by(5) do |post|
            post.created_at
        end
    end

    def avg_age
        self.bloggers.map do |blogger|
            blogger.age
        end.sum/bloggers.count
    end
end
