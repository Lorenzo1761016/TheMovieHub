require 'rails_helper'



RSpec.describe User, type: :model do
  subject {
    described_class.new(username: "LorenzoScarlino", email: "lorenzo@gmail.com", password: "oooooo")  }

  describe "Validations" do
    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without a username" do
      subject.username = nil
      expect(subject).to_not be_valid
    end
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
  end
end
