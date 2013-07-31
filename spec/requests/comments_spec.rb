require 'spec_helper'

describe "Comments" do
  describe "GET /comments" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get comments_path
      response.status.should be(200)
    end
  end

  describe "user can create a comment" do
    # go to a book page
    # create a comment on that book
  end
end
