namespace :mysql do
  desc "Install MySQL"
  task :install, :roles => :db do
    sudo "sudo aptitude install -y mysql-server mysql-client libmysqlclient15-dev libmysql-ruby1.8"
  end
end
