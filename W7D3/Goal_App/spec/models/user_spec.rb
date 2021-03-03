require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "Validations" do 
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_uniqueness_of(:username) }
  end

  describe "#password?" do
    let(:test_user) { User.create(username: 'Test', password: 'test123') }

    context "valid password" do
      it "should return true" do
        expect(:test_user.password?(:password)).to be true
      end
    end

    context "invalid password" do
      it "should return false" do
        expect(:test_user.password?('123')).to be false
      end
    end
  end


  describe "#is_password?" do
    let(:test_user) { User.create(username: 'Test', password: 'test123') }

    it "should not be saved to the database" do
      expect(test_user.password).not_to eq('test123')
    end
    
    it "should encrypt password" do
      test_user.is_password?('test123')

      expect(BCrypt::Password).to receive(:new).with('test123')
    end

    
  end

  describe "password=" do
    it "should generate a password digest" do
      

      expect(BCrypt::Password).to receive(:create).with('test123')
    end
  end



end
