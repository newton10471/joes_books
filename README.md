Joe's Books
=========

Joe's Books is meant to be used to manage the book selection for an office book club.  Users sign up and sign in, and start by adding books that they want to have as candidates in elections to select books for the club to read.  Users can add as many books as they want but the intent is for them to vote only 3 times per election round (this is not currently enforced by the application).  Within a single round, users can also change their vote until the round is complete.  The rounds themselves are somewhat manually managed by an admin user, designated as admin by a "true" in the admin column of the user model. 

An admin user can start a new election by going to the Admin Page (a link for which shows up when logged in as an admin user), and clicking on the first link to "Start a New Election".  This clears any existing votes on the current list of books for all users.  Once users have all voted, the admin can then click on "Complete a Voting Round" from the Admin Page.  This reduces the books which show up in users' voting forms, by not showing books that a) got no votes, or b) were in the bottom 1/3rd or so of voted-on books.  The remaining books then show up in the "All Votes" page as having a single vote a piece, and users can then proceed to vote on this subset in the next round.  Once again, everyone votes, and the admin clicking "Complete a Voting Round" will further reduce the number of votable books.  This continues until there's only one book left, and the last admin click of "Complete a Voting Round" will indicate that a winner has been chosen.

To facilitate testing, there's a rake task that can be called with the command "rake db:vote".  This will create 3 random votes for all existing users in the database with the exception of user "nobody@nowhere.com", which is involved in some administrative functions.