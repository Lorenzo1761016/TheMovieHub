require 'rails_helper'

RSpec.describe Favorite, type: :model do
  subject { described_class.new(user_id:1,fav_id:103,fav_type:"Film",name: "Avatar")  }
    
  describe "Validations" do 
    it "is not valid without user_id" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without fav_id" do
      subject.fav_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without fav_type" do
      subject.fav_type = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end

end
