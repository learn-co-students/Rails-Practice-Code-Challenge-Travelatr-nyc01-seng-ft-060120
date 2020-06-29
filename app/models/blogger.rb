class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :age, :inclusion => { in: 0...100 }
    validates :bio, :length => {:minimum => 30}
    validates :name, :presence => true, :uniqueness => true

end
