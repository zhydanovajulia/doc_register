require 'rails_helper'

RSpec.describe Document, type: :model do

  it { should have_db_column(:name) }
  it { should have_db_column(:title) }
  it { should have_db_column(:description) }

  describe "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end

end
