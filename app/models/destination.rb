# == Schema Information
#
# Table name: destinations
#
#  id         :integer          not null, primary key
#  name       :string
#  country    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Destination < ApplicationRecord
    has_many :posts
    has_many  :bloggers, through: :posts

    validates_presence_of :name, :country

    def featured_post
        post = posts.max_by { |post| post.likes }
    end

    def ordered_posts_by_date
        self.posts.order('posts.created_at DESC')
    end

    def average_age_of_blogger
        if self.bloggers.count > 0 
            ages = self.bloggers.map{ |b| b.age }
            ages.sum / ages.length
        end
        "There are no posts for this destination."
    end
end
