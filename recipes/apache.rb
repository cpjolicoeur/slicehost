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

  desc "Force reload Apache webserver"
  task :force_reload, :roles => :web do
    sudo "/etc/init.d/apache2 force-reload"
  end

  desc "List enabled Apache sites"
  task :enabled_sites, :roles => :web do
    run "ls /etc/apache2/sites-enabled"
  end

  desc "List available Apache sites"
  task :available_sites, :roles => :web do
    run "ls /etc/apache2/sites-available"
  end

  desc "List enabled Apache modules"
  task :enabled_modules, :roles => :web do
    run "ls /etc/apache2/mods-enabled"
  end

  desc "List available Apache modules"
  task :available_modules, :roles => :web do
    run "ls /etc/apache2/mods-available"
  end

  desc "Disable Apache site"
  task :disable_site, :roles => :web do
    site = Capistrano::CLI.ui.ask("Which site should we disable: ")
    sudo "sudo a2dissite #{site}"
    reload
  end

  desc "Enable Apache site"
  task :enable_site, :roles => :web do
    site = Capistrano::CLI.ui.ask("Which site should we enable: ")
    sudo "sudo a2ensite #{site}"
    reload
  end

  desc "Disable Apache module"
  task :disable_module, :roles => :web do
    mod = Capistrano::CLI.ui.ask("Which module should we disable: ")
    sudo "sudo a2dismod #{mod}"
    force_reload
  end

  desc "Enable Apache module"
  task :enable_module, :roles => :web do
    mod = Capistrano::CLI.ui.ask("Which module should we enable: ")
    sudo "sudo a2enmod #{mod}"
    force_reload
  end
end
