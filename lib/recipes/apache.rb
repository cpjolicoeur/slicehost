namespace :apache do
  desc "Restarts Apache webserver"
  task :restart, :roles => :web do
    sudo "/etc/init.d/apache2 restart"
  end

  desc "Starts Apache webserver"
  task :start, :roles => :web do
    sudo "/etc/init.d/apache2 start"
  end

  desc "Stops Apache webserver"
  task :stop, :roles => :web do
    sudo "/etc/init.d/apache2 stop"
  end

  desc "Reload Apache webserver"
  task :reload, :roles => :web do
    sudo "/etc/init.d/apache2 reload"
  end
end
