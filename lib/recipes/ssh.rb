ssh_options = { :keys => [File.expand_path("~/.ssh/id_dsa")], :port => 22 }

namespace :ssh do
  task :reload do
    sudo "/etc/init.d/ssh reload"
  end

  task :configure do
    upload_keys
    configure_sshd
    reload
  end

  task :upload_keys do
    run "mkdir -p ~/.ssh"
    run "chown -R #{user}:#{user} ~/.ssh"
    run "chmod 700 ~/.ssh"

    authorized_keys = ssh_options[:keys].collect { |key| File.read("#{key}.pub") }.join("\n")
    put authorized_keys, "/home/#{user}/.ssh/authorized_keys", :mode => 0600
  end

  task :configure_sshd do
    put render("sshd_config", binding), "/home/#{user}/sshd_config"
    sudo "mv /home/#{user}/sshd_config /etc/ssh/sshd_config"
  end
end
