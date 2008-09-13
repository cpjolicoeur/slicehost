Gem::Specification.new do |s|
  s.name     = "slicehost"
  s.version  = "0.0.2"
  s.date     = "2008-09-01"
  s.summary  = "Capistrano recipes for setting up and deploying to Slicehost"
  s.email    = "josh@joshpeek.com"
  s.homepage = "http://github.com/josh/slicehost"
  s.description = "Slicehost Capistrano recipes for configuring and managing your slice."
  s.has_rdoc = false
  s.authors  = ["Joshua Peek"]
  s.files    = ["README",
                "MIT-LICENSE",
                "slicehost.gemspec",
                "lib/capistrano/ext/slicehost",
                "lib/capistrano/ext/slicehost/apache.rb",
                "lib/capistrano/ext/slicehost/aptitude.rb",
                "lib/capistrano/ext/slicehost/disk.rb",
                "lib/capistrano/ext/slicehost/gems.rb",
                "lib/capistrano/ext/slicehost/git.rb",
                "lib/capistrano/ext/slicehost/iptables.rb",
                "lib/capistrano/ext/slicehost/mysql.rb",
                "lib/capistrano/ext/slicehost/render.rb",
                "lib/capistrano/ext/slicehost/ruby.rb",
                "lib/capistrano/ext/slicehost/slice.rb",
                "lib/capistrano/ext/slicehost/ssh.rb",
                "lib/capistrano/ext/slicehost/templates",
                "lib/capistrano/ext/slicehost/templates/iptables.erb",
                "lib/capistrano/ext/slicehost/templates/passenger.config.erb",
                "lib/capistrano/ext/slicehost/templates/passenger.load.erb",
                "lib/capistrano/ext/slicehost/templates/sshd_config.erb",
                "lib/capistrano/ext/slicehost/templates/vhost.erb",
                "lib/capistrano/ext/slicehost.rb"]
  s.add_dependency("capistrano", ["> 2.5.0"])
end
