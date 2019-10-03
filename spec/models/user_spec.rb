require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_db_column(:email) }
  it { should have_db_column(:encrypted_password) }

  describe "Validations" do
    it { should validate_presence_of(:email) }
  end
end
