class Article < ApplicationRecord
    has_rich_text :body
    
    extend FriendlyId
    friendly_id :title, use: :slugged

    validates_presence_of :title
end
