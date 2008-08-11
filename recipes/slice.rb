namespace :slice do
  task :configure do
    ssh.configure
    iptables.configure
    aptitude.setup
  end
end
