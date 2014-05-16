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
end
