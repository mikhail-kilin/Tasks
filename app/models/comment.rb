class Comment < ApplicationRecord
    validates_presence_of :content
    
    belongs_to :task
    belongs_to :user
end
