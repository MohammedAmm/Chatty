class Application < ApplicationRecord
  #Generate a secure token
  has_secure_token :token

  # model association
  has_many :chats, dependent: :destroy

  # validations
  validates :name, presence:true ,uniqueness: true

  #Mutators
end
