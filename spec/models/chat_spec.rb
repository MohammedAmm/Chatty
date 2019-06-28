require 'rails_helper'

RSpec.describe Chat, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:application) }
  # Association test
  # ensure Chat model has a 1:m relationship with the Message model
  it { should have_many(:messages).dependent(:destroy) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:title) }
end
