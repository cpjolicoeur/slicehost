namespace :iptables do
  task :configure do
    put render("iptables", binding), "/home/#{user}/iptables.up.rules"
    sudo "mv ~/iptables.up.rules /etc/iptables.up.rules"
    run %(cat /etc/network/interfaces |
      sed '/iface lo inet loopback/G' |
      sed -e '6s/.*/pre-up iptables-restore < \\/etc\\\/iptables.up.rules/' >
      ~/interfaces
    )
    sudo "mv ~/interfaces /etc/network/interfaces"
  end
end
