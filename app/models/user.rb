class User < ApplicationRecord
  devise :database_authenticatable, :confirmable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :subjects
  has_many :topics
  has_many :notes
  
end
