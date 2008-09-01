# TODO: Automatically determine these values
set :ruby_enterprise_version, "ruby-enterprise-1.8.6-20080810"
set :passenger_version, "2.0.3"

namespace :ruby do
  desc "Install Ruby 1.8"
  task :setup_18, :roles => :app do
    sudo "aptitude install -y ruby1.8-dev ruby1.8 ri1.8 rdoc1.8 irb1.8 libreadline-ruby1.8 libruby1.8 libopenssl-ruby sqlite3 libsqlite3-ruby1.8"

    sudo "ln -s /usr/bin/ruby1.8 /usr/bin/ruby"
    sudo "ln -s /usr/bin/ri1.8 /usr/bin/ri"
    sudo "ln -s /usr/bin/rdoc1.8 /usr/bin/rdoc"
    sudo "ln -s /usr/bin/irb1.8 /usr/bin/irb"
  end

  desc "Install Ruby Enterpise Edition"
  task :install_enterprise, :roles => :app do
    run "test ! -d /opt/#{ruby_enterprise_version}"
    run "wget -q http://rubyforge.org/frs/download.php/41040/#{ruby_enterprise_version}.tar.gz"
    run "tar xzvf #{ruby_enterprise_version}.tar.gz"
    run "rm #{ruby_enterprise_version}.tar.gz"
    sudo "./#{ruby_enterprise_version}/installer --auto /opt/#{ruby_enterprise_version}"
    sudo "rm -rf #{ruby_enterprise_version}/"
  end

  desc "Install Phusion Passenger"
  task :install_passenger, :roles => :app do
    sudo "apt-get install apache2-mpm-prefork"
    sudo "/opt/#{ruby_enterprise_version}/bin/ruby /opt/#{ruby_enterprise_version}/bin/gem install install passenger"
    sudo "/opt/#{ruby_enterprise_version}/bin/ruby /opt/#{ruby_enterprise_version}/bin/passenger-install-apache2-module"

    put render("passenger.load", binding), "/home/#{user}/passenger.load"
    put render("passenger.config", binding), "/home/#{user}/passenger.config"

    sudo "mv /home/#{user}/passenger.load /etc/apache2/mods-available/"
    sudo "mv /home/#{user}/passenger.config /etc/apache2/mods-available/"

    sudo "a2enmod passenger"
    apache.force_reload
  end
end
