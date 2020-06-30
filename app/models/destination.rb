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

    def feature_title
        featured_post.title
    end

    def feature_blogger_name
        featured_post.blogger.name
    end

    def feature_content
        featured_post.content
    end

    def feature_likes
        featured_post.likes
    end

    def ordered_posts_by_date
        self.posts.order('posts.created_at ASC')[0..-2]
    end

    def unique_bloggers
        self.bloggers.uniq { |b| b.id}
    end

    def average_age_of_blogger
        if self.bloggers.count === 0
            "There are no posts for this destination"
        elsif self.bloggers.count === 1
            self.bloggers.first.age
        else
            ages = self.unique_bloggers.map{ |b| b.age }
            ages.sum / ages.length
        end
    end
end
