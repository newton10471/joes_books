require 'spec_helper'

describe BooksController do
  let(:user) { create :user}
  let!(:book) { create :book, user: user}

  describe "GET#index" do
    it "should have an index action" do
      sign_in user
      get :index
      response.should be_success
      assigns(:books).should eq([book])
    end
  end
end

