class Topic < ApplicationRecord
    belongs_to :subject 
    has_many :notes, dependent: :destroy
    validates_presence_of :title
end
