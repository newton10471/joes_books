namespace :db do
  desc "Generate system users and config"
  task makeenv: :environment do
    # create nobody user
    if User.find_by_email("nobody@nowhere.com").nil?
      User.create!(first_name: "nobody",
                  last_name: "nobody",
                  email: "nobody@nowhere.com",
                  password: "ok4now",
                  password_confirmation: "ok4now")
      # disable logins for user nobody
      user = User.find_by_email("nobody@nowhere.com")
      user.lock_access!
    end
    if ConfigParameter.find_by_name("second_round_started").nil? 
      config = ConfigParameter.new(name: "second_round_started", value: "false")
      config.save
    end
  end
end
