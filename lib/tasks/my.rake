namespace :my do
  desc "TODO"
  task migrate_all: :environment do
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:test:prepare"].invoke
  end
end
