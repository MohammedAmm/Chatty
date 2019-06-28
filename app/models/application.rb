class Application < ApplicationRecord
  #callbacks
  after_create :chats_redis
  #Generate a secure token
  has_secure_token :token

  # model association
  has_many :chats, dependent: :destroy

  # validations
  validates :name, presence:true ,uniqueness: true

  #Mutators
  #Get count of all chats within application
  # def chats_count_redis(modify_value = 0)
  #   my_key = "application/#{self.id}/chats_count"
  #   if (my_value = Rails.cache.read my_key) then
  #     my_value = my_value.to_i + modify_value
  #   else 
  #     my_value = 0
  #   end
  #   Rails.cache.write "application/#{self.id}/chats_count" , my_value, raw: true
  #   my_value
  # end

  # # Get number of last chat to increament on while storing
  # def chats_number_redis
  #   my_key = "application/#{self.id}/chats_number"
  #   if (my_value = Rails.cache.read my_key) then
  #     my_value = my_value.to_i + 1
  #   else 
  #     my_value = 0
  #   end
  #   Rails.cache.write "application/#{self.id}/chats_number" , my_value, raw: true
  #   my_value
  # end

  # This part dealing with redis
  # Parameter key have either chats_count or chats_number
  def chats_redis(key = nil)
    if (key) then
      my_value = Rails.chache.read(set_my_key key)
    else
      my_value = '0'
      Rails.cache.write (set_my_key 'chats_count'), my_value, raw: true
      Rails.cache.write (set_my_key 'chats_number'), my_value, raw: true
    end

    my_value.to_i
  end

  # Parameter key have either chats_count or chats_number
  def chats_redis_key_increament(key)
    my_value = Rails.cache.increment(set_my_key key)
    my_value.to_i

  end

  # Parameter key have either chats_count or chats_number
  def chats_redis_key_decreament(key)
    my_value = Rails.cache.decrement(set_my_key key)
    my_value.to_i
  end

  private

  def set_my_key(key)
    "applications/#{self.id}/#{key}"
  end

end
