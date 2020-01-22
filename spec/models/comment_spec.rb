require 'rails_helper'

RSpec.describe Comment, type: :model do
    subject { described_class.new(username: "LorenzoSca", body: "Bel Film!"  )  }
     


    describe "Validations" do 
     it "is not valid without username" do
        subject.username = nil
        expect(subject).to_not be_valid
     end
     it "is not valid without body" do
        subject.body = nil
        expect(subject).to_not be_valid
     end  
     it "is valid with valid attributes" do
        expect(subject).to be_valid
     end
    end

    describe "Associations" do
     it { should have_many :comments }
    end      
  end
  