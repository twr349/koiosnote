class Topic < ApplicationRecord
    belongs_to :subject 
    validates_presence_of :title
    validates_presence_of :body


end
