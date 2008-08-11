namespace :ruby do
  task :setup_18, :roles => :app do
    sudo "aptitude install -y ruby1.8-dev ruby1.8 ri1.8 rdoc1.8 irb1.8 libreadline-ruby1.8 libruby1.8 libopenssl-ruby sqlite3 libsqlite3-ruby1.8"

    sudo "ln -s /usr/bin/ruby1.8 /usr/bin/ruby"
    sudo "ln -s /usr/bin/ri1.8 /usr/bin/ri"
    sudo "ln -s /usr/bin/rdoc1.8 /usr/bin/rdoc"
    sudo "ln -s /usr/bin/irb1.8 /usr/bin/irb"
  end

  task :install_ree, :roles => :app do
    run "wget http://rubyforge.org/frs/download.php/41040/ruby-enterprise-1.8.6-20080810.tar.gz"
    run "tar xzvf ruby-enterprise-1.8.6-20080810.tar.gz"
    # sudo "./ruby-enterprise-1.8.6-20080810/installer"

    # sudo "ln -sf /opt/ruby-enterprise-1.8.6-20080810/bin/ruby /usr/bin/ruby"
    # sudo "ln -sf /opt/ruby-enterprise-1.8.6-20080810/bin/ri /usr/bin/ri"
    # sudo "ln -sf /opt/ruby-enterprise-1.8.6-20080810/bin/rdoc /usr/bin/rdoc"
    # sudo "ln -sf /opt/ruby-enterprise-1.8.6-20080810/bin/irb /usr/bin/irb"
    # sudo "ln -sf /opt/ruby-enterprise-1.8.6-20080810/bin/rake /usr/bin/rake"
  end

  task :install_passenger, :roles => :app do
    sudo "apt-get install apache2-mpm-prefork"
    # sudo "/opt/ruby-enterprise-1.8.6-20080810/bin/ruby /opt/ruby-enterprise-1.8.6-20080810/bin/gem install install passenger"
    # sudo "/opt/ruby-enterprise-1.8.6-20080810/bin/ruby /opt/ruby-enterprise-1.8.6-20080810/bin/passenger-install-apache2-module"

    put render("passenger.load", binding), "/home/#{user}/passenger.load"
    put render("passenger.config", binding), "/home/#{user}/passenger.config"

    sudo "mv /home/#{user}/passenger.load /etc/apache2/mods-available/"
    sudo "mv /home/#{user}/passenger.config /etc/apache2/mods-available/"

    sudo "a2enmod passenger"
    apache.force_reload
  end
end
