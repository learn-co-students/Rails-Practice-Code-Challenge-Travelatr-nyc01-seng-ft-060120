class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def most_recent_posts
        self.posts.last(5)
    end

    def most_liked_post
       self.posts.max_by(&:likes)
    end

    def average_age
      # If bloggers are empty return 0
      if !self.bloggers.empty?
          bloggers_age = self.bloggers.uniq.map(&:age)
          return bloggers_age.inject{|sum, n| sum + n} / bloggers_age.length
      end
      0
    end

end
