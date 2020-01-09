class Task < ApplicationRecord
    validates_presence_of :title, :content

    has_many :comments, dependent: :destroy
    belongs_to :user
end
