
class Post < ApplicationRecord
    belongs_to :blogger
    belongs_to :destination

    validates_presence_of :title, :content
    validates_presence_of :likes, numericality: {:minimum => 0}
    validates_length_of :content, { :minimum => 100 }

    def blogger_name
        self.blogger.name
    end

    def destination_name
        self.destination.name
    end

    def country_name
        self.destination.country
    end
    
end
