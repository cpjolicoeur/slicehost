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
  s.files    = Dir["README", "MIT-LICENSE", "lib/capistrano/ext/**/*"]
  s.add_dependency("capistrano", ["> 2.5.0"])
end
