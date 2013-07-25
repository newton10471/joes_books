require 'spec_helper'

describe Comment do 
  before do
    @user = User.new(first_name: "Example", last_name: "User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
    @book = Book.new(title: "Book Title", author: "Book Author", user_id: @user.id) 
    @comment = Comment.new(text: "sample comment text", user_id: @user.id, book_id: @book.id)
  end
  
  subject { @comment }

  it { should respond_to(:text) }
  it { should respond_to(:user_id) }
  it { should respond_to(:book_id) }

  it { should be_valid }
end

