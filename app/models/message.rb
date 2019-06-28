class Message < ApplicationRecord
  # model association
  belongs_to :chat

  # validations
  validates :number, uniqueness: { scope: :chat_id }
  validates_presence_of :body

  #Accessors
  searchkick highlight: [:body], searchable: [:body]

end
