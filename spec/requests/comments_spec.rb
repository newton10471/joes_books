require 'spec_helper'

def sign_in_user(user)
  visit '/accounts/sign_in' 
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_on 'Sign in'
end

describe "Comments" do

  subject { page }

  before(:all) { 
  }

  after(:all) {
    User.destroy_all
  }

  describe 'should be able to log in' do
    it "login" do
      @user = FactoryGirl.create(:user) 
      sign_in_user @user 
      visit root_path
      expect(page).to have_content 'My Book List'
    end

    #it { should have_link 'Logout' }
    #it { should have_content 'My Book List' }
  end

  describe "visit /comments" do
#    let(:book) { FactoryGirl.create :book, user: user } 
#    let(:comment) { FactoryGirl.create :comment, user: user, book: book } 
    it "works! (now write some real specs)" do
      @user = FactoryGirl.create(:user) 
      sign_in_user @user 
      # get comments_path
      visit comments_path
      #response.status.should be(200)
      expect(page).to have_content 'Comment List'
    end
  end

  describe "user can create a book" do
    it 'should allow a user to create a book' do
      @user = FactoryGirl.create(:user) 
      sign_in_user @user 
      visit root_path
      click_on 'New Book'
      fill_in 'Title', with: 'Moby Dick'
      fill_in 'Author', with: 'Herman Melville'
      fill_in 'book_asin', with: '0143105957'
      click_on 'Create Book'
      expect(page).to have_content 'Book was successfully created'
    end
  end

  describe "user can create a comment" do
    it 'should allow a user to create a comment' do 
      @user = FactoryGirl.create(:user) 
      sign_in_user @user 
      @book = FactoryGirl.create(:book, user: @user, asin: '0393972836')
#      binding.pry
      visit user_book_path @user, @book
      fill_in 'comment_text', with: 'test comment text'
      click_on 'Post Comment'
      expect(page).to have_content 'Comment was successfully created'
    end
  end
end
