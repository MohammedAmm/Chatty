class Chat < ApplicationRecord
  #callbacks
  # after_create :messages_redis

  # model association
  belongs_to :application
  has_many :messages, dependent: :destroy

  # validations
  validates :number, uniqueness: { scope: :application_id }
  validates :title, presence: true

end
