namespace :db do
  desc "Populate database with test data"
  task :populate => :environment do
    EMAIL_DOMAIN = 'bookr.com'

    puts "*** Deleting loaded data from database..."
    [Author, Category, Tag, Book, User].each(&:delete_all)

    puts "*** Creating Authors..."
    20.times do
      Author.create!(
        :first_name => Faker::Name.first_name,
        :last_name  => Faker::Name.last_name,
        :bio         => Faker::Lorem.paragraphs(3).join(' ')
      )
    end
    AUTHOR_IDS_LIST = Author.all.collect(&:id)

    puts "*** Creating Categories..."
    ["Internet", "Web Development", "Social Networking", "Web Design",
     "Usability", "UX", "HTML&CSS Hacks", "Misc"].each do |category_name|
      Category.create!(:name => category_name)
    end

    puts "*** Creating Tags..."
    20.times do
      Tag.create(:name => Faker::Lorem.words(1).join)
    end
    TAG_IDS_LIST = Tag.all.collect(&:id)

    puts "*** Creating Books..."
    100.times do
      Book.create!(
        :category    => Category.all.rand,
        :title        => Faker::Name.name,
        :abstract     => Faker::Lorem.paragraphs(2).join(' '),
        :description => Faker::Lorem.paragraphs(6).join(' '),
        :volumes      => [1,2,3,4,5].rand,
        :published_on => (10.years.ago.to_date..Time.now.to_date).to_a.rand,
        :author_ids   => [AUTHOR_IDS_LIST.rand],
        :tag_ids      => [TAG_IDS_LIST.rand]
      )
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

