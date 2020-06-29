# == Schema Information
#
# Table name: bloggers
#
#  id         :integer          not null, primary key
#  name       :string
#  bio        :string
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates_presence_of :name, uniqueness: true
    validates_presence_of :age, numericality: {:minimum => 1}
    validates_presence_of :bio
    validates_length_of :bio, minimum: 31
end
