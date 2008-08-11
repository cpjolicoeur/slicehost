namespace :disk do
  desc "Show the amount of free disk space."
  task :free, :roles => :files do
    run "df -h /"
  end
end
