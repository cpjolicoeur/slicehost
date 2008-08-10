namespace :gems do
  desc "List gems on remote server"
  task :list do
    stream "gem list"
  end

  desc "Update gems on remote server"
  task :update do
    sudo "gem update"
  end

  desc "Install a gem on the remote server"
  task :install do
    name = Capistrano::CLI.ui.ask("Which gem should we install: ")
    sudo "gem install #{name}"
  end

  desc "Uninstall a gem on the remote server"
  task :uninstall do
    name = Capistrano::CLI.ui.ask("Which gem should we uninstall: ")
    sudo "gem uninstall #{name}"
  end
end
