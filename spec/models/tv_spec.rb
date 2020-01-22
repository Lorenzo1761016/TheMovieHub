require 'rails_helper'

RSpec.describe Tv, type: :model do
  subject { described_class.new(id: 103)  }
    
    describe "Validations" do 
      it "is not valid without id" do
        subject.id = nil
        expect(subject).to_not be_valid
      end
      it "is valid with valid attributes" do
        expect(subject).to be_valid
      end
    end

    describe "Associations" do
      it { should have_many(:comments) }
    end
    
end
