class Chat < ApplicationRecord
  #callbacks
  after_create :messages_redis

  # model association
  belongs_to :application
  has_many :messages, dependent: :destroy

  # validations
  validates :number, uniqueness: { scope: :application_id }
  validates :title, presence: true

  #Mutations
  def messages_redis(key = nil)
    if (key) then
      my_value = Rails.chache.read(set_my_key key)
    else
      my_value = '0'
      Rails.cache.write((set_my_key 'messages_count'), my_value, raw: true)
      Rails.cache.write((set_my_key 'messages_number'), my_value, raw: true)
    end

    my_value.to_i
  end

  # Parameter key have either messages_count or messages_number
  def messages_redis_key_increament(key)
    my_value = Rails.cache.increment(set_my_key key)
    my_value.to_i
  end

  # Parameter key have either messages_count or messages_number
  def messages_redis_key_decreament(key)
    Rails.cache.decrement(set_my_key key)
    my_value.to_i
  end

  private

  def set_my_key(key)
    "chats/#{self.id}/#{key}"
  end
end
