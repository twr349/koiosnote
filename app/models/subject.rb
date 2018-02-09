class Subject < ApplicationRecord
    belongs_to :user
    has_many :topics, dependent: :destroy
    validates_presence_of :name

end
