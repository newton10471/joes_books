require 'spec_helper'

def sign_in_user(user)
  visit '/accounts/sign_in' 
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_on 'Sign in'
end

describe "Comments" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  before { sign_in_user user }

  describe 'should be able to log in' do
    it "login" do
      visit '/accounts/sign_in' 
      expect(page).to have_content 'My Book List'
    end

    #it { should have_link 'Logout' }
    #it { should have_content 'My Book List' }
  end

  describe "GET /comments" do
    let(:book) { FactoryGirl.create :book, user: user } 
    let(:comment) { FactoryGirl.create :comment, user: user, book: book } 
    it "works! (now write some real specs)" do
      get comments_path
      # response.status.should be(200)
      binding.pry
      expect(page).to have_content 'Comment List'
    end
  end

  describe "user can create a book" do
    it 'should allow a user to create a book' do
      visit root_path
      click_on 'New Book'
      fill_in 'Title', with: 'Moby Dick'
      fill_in 'Author', with: 'Herman Melville'
      fill_in 'Asin', with: '0143105957'
      expect(page).to have_content 'Book was successfully created'
    end
  end

  describe "user can create a comment" do
    # go to a book page
    # create a comment on that book
    pending
  end
end
