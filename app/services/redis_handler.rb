class RedisHandler
  def initialize(first_part, id)
    @first_part = first_part
    @id = id
    @key_number = set_my_key(first_part, 'number', id)
    @key_count = set_my_key(first_part, 'count', id)

  end

  def create
      write
  end

  # Parameter key have either chats_count or chats_number
  def increment
    number = Rails.cache.increment(@key_number)
    count = Rails.cache.increment(@key_count)
    {number: number, count: count}
  end

  # Parameter key have either chats_count
  def decrement
    #don't have to decrease number because we will use it as our identifier in case of deletion will make deplucation identifier.
    my_value = Rails.cache.decrement(@key_count)
    my_value.to_i
  end

  private

  def set_my_key(first_part, key, id)
    "#{first_part}s/#{id}/#{first_part == 'application' ? 'chats' : 'messages' }_#{key}"
  end

  def write
    Rails.cache.write @key_count, 0, raw: true
    Rails.cache.write @key_number, 0, raw: true
  end

  def read(key)
    my_value = Rails.chache.read(key)
    my_value.to_i
  end
  
end