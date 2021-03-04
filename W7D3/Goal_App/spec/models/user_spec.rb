require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:test_user) { User.create(username: 'Test', password: 'test123') }
  describe "Validations" do 
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:session_token) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_uniqueness_of(:username) }
  end

  # describe "#password?" do
  #   context "valid password" do
  #     it "should return true" do
  #       expect(:test_user.password?(:password)).to be true
  #     end
  #   end

  #   context "invalid password" do
  #     it "should return false" do
  #       expect(:test_user.password?('123')).to be false
  #     end
  #   end
  # end


  describe "#is_password?" do
    it "should not be saved to the database" do
      expect(test_user.password).not_to eq('test123')
    end
    
    it "should encrypt password" do
      test_user.is_password?('test123')

      expect(BCrypt::Password).to receive(:new).with('test123')
    end

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

  describe "password=" do
    it "should generate a password digest" do
      test_user.password=('test123')

      expect(BCrypt::Password).to receive(:create).with('test123')
    end
  end

  describe "::find_by_credentials" do

    it 'should return user if found' do
      user = User.find_by_credentials(test_user.username, 'test123')
      expect(user).to eq(test_user)
    end

    it "should not return user if invalid password" do
      user = User.find_by_credentials(test_user.username, "invalid123")
      expect(user).to eq(nil)
    end

    it "should not return user if invalid username" do
      user = User.find_by_credentials("123123", "test123")
      expect(user).to eq(nil)
    end
  end



end
