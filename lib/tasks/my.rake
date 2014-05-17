namespace :my do
  desc "Migrate test and dev databases"
  task migrate_all: :environment do
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:test:prepare"].invoke
  end


  desc "Deletes todo items older than 7 days"
  task delete_items: :environment do
    Todo.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

  desc "Creates n new todos for test@test.com"
  task :create_todos, [:todo_count, :verbose] => :environment do |t, args|
    verbose = args[:verbose].match(/true/i) ?  true : false
    count = args[:todo_count]
    u = User.first
    count.to_i.times do |num|
      if verbose
        p FactoryGirl.create(:todo, user: u)
      else
        FactoryGirl.create(:todo, user: u)
      end
    end
  end
end
