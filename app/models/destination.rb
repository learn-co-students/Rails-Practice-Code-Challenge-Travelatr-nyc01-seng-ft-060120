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
        post = posts.max_by { |post| post.blogger_id }
    end

    def remaining_posts
        self.posts
    end
end
