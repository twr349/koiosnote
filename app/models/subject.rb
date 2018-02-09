class Subject < ApplicationRecord
    has_many :topics, dependent: :destroy
    
    validates_presence_of :name

end
