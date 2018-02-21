class User < ApplicationRecord
  devise :database_authenticatable, :confirmable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :subjects, dependent: :destroy
  has_many :notes, dependent: :destroy
  
end
