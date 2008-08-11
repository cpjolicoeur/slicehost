ssh_options = { :keys => [File.expand_path("~/.ssh/id_dsa")], :port => 22 }

namespace :ssh do
  task :reload, :roles => :gateway do
    sudo "/etc/init.d/ssh reload"
  end

  desc <<-DESC
    Configure SSH on the gateway host. Runs `upload_keys` and `configure_sshd` \
    then reloads the SSH service to finalize the changes.
  DESC
  task :configure, :roles => :gateway do
    upload_keys
    configure_sshd
    reload
  end

  desc <<-DESC
    Uploads your local public SSH keys to the server. A .ssh folder is created if \
    one does not already exist. The SSH keys default to the ones set in \
    Capistrano's ssh_options. You can change this by setting ssh_options[:keys] = \
    ["/home/user/.ssh/id_dsa"].
  DESC
  task :upload_keys, :roles => :gateway do
    run "mkdir -p ~/.ssh"
    run "chown -R #{user}:#{user} ~/.ssh"
    run "chmod 700 ~/.ssh"

    authorized_keys = ssh_options[:keys].collect { |key| File.read("#{key}.pub") }.join("\n")
    put authorized_keys, "/home/#{user}/.ssh/authorized_keys", :mode => 0600
  end

  desc <<-DESC
    Configure SSH daemon with more secure settings recommended by Slicehost. The \
    will be configured to run on the port configured in Capistrano's "ssh_options". \
    This defaults to the standard SSH port 22. You can change this by setting \
    ssh_options[:port] = 3000. Note that this change will not take affect until \
    reload the SSH service with `cap ssh:reload`.
  DESC
  task :configure_sshd, :roles => :gateway do
    put render("sshd_config", binding), "/home/#{user}/sshd_config"
    sudo "mv /home/#{user}/sshd_config /etc/ssh/sshd_config"
  end
end
