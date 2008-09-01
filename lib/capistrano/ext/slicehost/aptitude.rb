namespace :aptitude do
  task :update do
    sudo "aptitude update"
  end

  task :upgrade do
    safe_upgrade
  end

  task :safe_upgrade do
    sudo "aptitude safe-upgrade -y"
  end

  task :full_upgrade do
    sudo "aptitude full-upgrade -y"
  end

  task :install do
    package = Capistrano::CLI.ui.ask("Which package should we install: ")
    sudo "aptitude install #{package}"
  end

  task :uninstall do
    package = Capistrano::CLI.ui.ask("Which package should we uninstall: ")
    sudo "aptitude remove #{package}"
  end

  task :setup do
    update
    sudo "locale-gen en_GB.UTF-8"
    sudo "/usr/sbin/update-locale LANG=en_GB.UTF-8"
    safe_upgrade
    full_upgrade
    sudo "aptitude install -y build-essential"
  end
end
