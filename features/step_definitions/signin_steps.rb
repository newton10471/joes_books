Given(/^I have user "(.*?)" with password "(.*?)"$/) do |email, password|
  User.create(email: email, password: password, password_confirmation: password, first_name: 'Ken', last_name: 'Admin')
end
