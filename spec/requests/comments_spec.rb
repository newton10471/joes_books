require 'spec_helper'

describe "Comments" do
  def sign_in_user(user)
    visit '/accounts/sign_in' 
    # user = FactoryGirl.create(:user)
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
  end


  describe 'should be able to log in' do
    xit "login" do
      visit '/accounts/sign_in' 
      user = FactoryGirl.create(:user)
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Sign in'
      expect(page).to have_content 'My Book List'
    end

    #it { should have_link 'Logout' }
    #it { should have_content 'My Book List' }
  end
  
  describe "GET /comments" do
    let(:user) { FactoryGirl.create :user }
    let(:book) { FactoryGirl.create :book } # TODO: connect this to the above user
    let(:comment) { FactoryGirl.create :comment } # TODO: connect this to the above book
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      sign_in_user(user)
      # binding.pry
      get comments_path
      # response.status.should be(200)
      # binding.pry
      expect(page).to have_content 'Comment List'
    end
  end

  #describe "user can create a comment" do
  #  # go to a book page
  #  # create a comment on that book
  #end
end
