require 'rails_helper'

RSpec.describe Message, type: :model do
  # Association test
  # ensure a message record belongs to a single chat record
  it { should belong_to(:chat) }
  # Validation tests
  # ensure columns name are present before saving
  it { should validate_presence_of(:body) }
end
