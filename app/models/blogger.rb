class Blogger < ApplicationRecord
    has_many :posts 
    has_many :destinations, through: :posts
    validates :name, :presence => true
    validates :name, :uniqueness => true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, :length => { :minimum => 31}

# total likes 
    def total_likes
        numbers_arr = self.posts.map do |post| 
            post.likes
    end 
    numbers_arr.inject(0) {|sum,x| sum + x}
    end

    def most_liked
       self.posts.max_by do |post|
            post.likes
        end
    end

end
