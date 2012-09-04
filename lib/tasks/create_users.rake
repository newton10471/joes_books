namespace :db do
  desc "Generate system users"
  task makeusers: :environment do
    # create nobody user
    if User.find_by_email("nobody@nowhere.com").nil?
      User.create!(first_name: "nobody",
                  last_name: "nobody",
                  email: "nobody@nowhere.com",
                  password: "ok4now",
                  password_confirmation: "ok4now")
    end
  end
end
