#whitelistEntry $port
# Replace <localhost> by your host name if you want
# Or add a similar line with your host in place to whitelist multiple hosts
whitelistLocalEntry() {
  iptables -I INPUT -p tcp -s localhost --dport $1 -j ACCEPT
}

#blacklistEntry $port
blacklistEntry() {
  iptables -A INPUT -p tcp --dport $1 -j DROP
}

resetFirewall() {
  iptables -F
  iptables -X
}

resetFirewall
for port in "$@"
do
    whitelistLocalEntry $port
    blacklistEntry $port
done
