class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :age, :inclusion => { in: 0...100 }
    validates :bio, :length => {:minimum => 30}
    validates :name, :presence => true, :uniqueness => true

    def total_likes
      self.posts.sum(&:likes)
    end

    def featured_post
      self.posts.max_by(&:likes)
    end

    def top_5
      # Sort by most post and return top 5
      self.destinations.sort_by{|d| d.posts.count}.reverse!.first(5)
    end

end
