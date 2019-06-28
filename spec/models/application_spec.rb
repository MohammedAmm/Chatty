require 'rails_helper'

RSpec.describe Application, type: :model do
  # Association test
  # ensure Application model has a 1:m relationship with the Chat model
  it { should have_many(:chats).dependent(:destroy) }
   # Validation tests
  # ensure columns name are present before saving
  it { should validate_presence_of(:name) }
end
