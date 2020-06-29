# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  title          :string
#  content        :text
#  likes          :integer
#  blogger_id     :integer
#  destination_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates_presence_of :title, :content
    validates_presence_of :likes, numericality: {:minimum => 0}

    
end
