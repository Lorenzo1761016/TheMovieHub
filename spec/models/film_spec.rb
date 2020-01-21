require 'rails_helper'

RSpec.describe Film, type: :model do
  subject { described_class.new(film_id: 103)  }
    
    describe "Validations" do 
      it "is valid with valid attributes" do
        expect(subject).to be_valid
      end
    end
    
end
