require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "renders index page" do
      get :index
      expect(response).to render_template(:index)
    end
  end

    describe "POST #create" do
        let(:user) { user.create(username: "test", password: "123123")}

        context "valid params" do
            it "should create a user" do
                expect(user.username).to eq("test")
            end

            it "should log them in" do
                expect(session:[:session_token]).to eq(user.session_token)
            end
        end

        context "invalid params" do
            it "should redirect them to sign up page" do
                expect(response).to render_template(:new)
            end

            it "should show errors" do
                expect(flash[:errors]).to be_present
            end
        end

    end

    describe "GET #show" do
        let(:user) { user.create(username: "test", password: "123123")}

        it "shows the user's info" do
            get :show

            expect(response).to render_template(:show)
        end

    end

end
