namespace :db do
  desc "Populate database with test data"
  task :populate => :environment do
    EMAIL_DOMAIN = 'bookr.com'

    puts "*** Deleting loaded data from database..."
    [Author, Tag, User].each(&:delete_all)

    puts "*** Creating Authors..."
    20.times do
      Author.create!(
        :first_name => Faker::Name.first_name,
        :last_name  => Faker::Name.last_name,
        :bio         => Faker::Lorem.paragraphs(3).join(' ')
      )
    end

    puts "*** Creating Tags..."
    20.times do
      Tag.create(:name => Faker::Lorem.words(1).join)
    end

    puts "*** Creating Users..."
    ["admin", "superman", "batman", "hulk"].each do |username|
      puts "*** -- Creating #{username}'s user account"
      user           = User.new
      user.full_name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
      user.email     = "#{username}@#{EMAIL_DOMAIN}"
      user.login     = username
      user.password  = user.password_confirmation = username
      user.save!
    end
  end
end

