class Note < ApplicationRecord
    belongs_to :topic
    validates_presence_of :title
    validates_presence_of :body
end
