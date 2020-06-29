class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: {greater_than: 0}
    validates :bio, length: {minimum: 30}

    def likes
        total = 0
        self.posts.each do |post|
            total += post.likes
        end
        total
    end

    def most_liked
        self.posts.max_by do |post|
            post.likes
        end
    end

    def most_posts_destinations
        self.destinations.max_by(5) do |d|
            d.posts.where(blogger: self).count
        end
    end
end
